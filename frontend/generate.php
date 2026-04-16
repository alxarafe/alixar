<?php
$resources = [
    ['name' => 'Ticket', 'folder' => 'tickets', 'pathKey' => 'tickets', 'Spanish' => 'Tickets'],
    ['name' => 'Category', 'folder' => 'categories', 'pathKey' => 'categorias', 'Spanish' => 'Categorías'],
    ['name' => 'Contract', 'folder' => 'contracts', 'pathKey' => 'contratos', 'Spanish' => 'Contratos'],
    ['name' => 'SupplierProposal', 'folder' => 'supplier-proposals', 'pathKey' => 'presupuestos-proveedor', 'Spanish' => 'Presupuestos de Proveedor']
];

$basePath = __DIR__ . '/src/views';

foreach ($resources as $res) {
    extract($res);
    $dirPath = $basePath . '/' . $folder;
    if (!is_dir($dirPath)) {
        mkdir($dirPath, 0777, true);
    }
    
    $listView = <<<VUE
<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { api } from '../../api'
import type { {$name} } from '../../api'
import EntityList, { type Column } from '../../components/EntityList.vue'
import { useRouter } from 'vue-router'

const router = useRouter()
const rows = ref<{$name}[]>([])
const total = ref(0)
const page = ref(1)
const limit = ref(50)
const loading = ref(true)
const error = ref<string | null>(null)

const columns: Column[] = [
  { key: 'id', label: 'ID', width: '60px', format: (v: number) => `#\${v}` },
  { key: 'ref', label: 'Referencia' }
]

const loadData = async () => {
  try {
    loading.value = true
    rows.value = (await api.get{$name}s({ limit: limit.value, page: page.value - 1 })) as {$name}[]
    total.value = rows.value.length < limit.value ? (page.value - 1) * limit.value + rows.value.length : page.value * limit.value + 1
  } catch (e: any) { error.value = e.message } finally { loading.value = false }
}

onMounted(loadData)

const handleCreate = () => {
  router.push({ name: 'resource-create', params: { resource: '{$pathKey}' } })
}
</script>

<template>
  <div>
    <div v-if="error" class="glass-panel error-panel">⚠️ {{ error }}</div>
    <div v-else-if="loading" class="loading">Cargando {$Spanish}...</div>
    <EntityList v-else :columns="columns" :rows="rows" :total="total" :page="page" :limit="limit"
      title="{$Spanish}" create-label="Crear {$name}" detail-route="{$name}-ficha".toLowerCase()
      @create="handleCreate" @page-change="(p: number) => { page = p; loadData() }" @limit-change="(l: number) => { limit = l; page = 1; loadData() }" />
  </div>
</template>
VUE;

    file_put_contents($dirPath . '/' . $name . 'ListView.vue', $listView);
    
    $lowerName = strtolower($name);
    $camelName = lcfirst($name);
    
    $detailView = <<<VUE
<script setup lang="ts">
import { ref, onMounted, computed, provide } from 'vue'
import { useRoute } from 'vue-router'
import { api } from '../../api'
import type { {$name} } from '../../api'
import TabBar, { type Tab } from '../../components/TabBar.vue'
import { entityFields } from '../../config/fields'

const route = useRoute()
const entity = ref<{$name} | null>(null)
const loading = ref(true)
const error = ref<string | null>(null)
const entityId = computed(() => Number(route.params.id))

const tabs = computed<Tab[]>(() => [
  { key: 'ficha', label: 'Ficha', icon: '📋', route: { name: '{$lowerName}-ficha', params: { id: entityId.value } } },
  { key: 'notas', label: 'Notas', icon: '📝', route: { name: '{$lowerName}-notas', params: { id: entityId.value } } },
])

const loadEntity = async () => {
  try { loading.value = true; entity.value = (await api.get{$name}(entityId.value)) as {$name} }
  catch (e: any) { error.value = e.message } finally { loading.value = false }
}
onMounted(loadEntity)
provide('entity', entity)
provide('reloadEntity', loadEntity)
provide('fichaFields', (entityFields as any).{$camelName})
provide('updateEntity', (data: any) => (api.update{$name} as any)(entityId.value, data).then(loadEntity))
</script>

<template>
  <div>
    <div v-if="error" class="glass-panel error-panel">⚠️ {{ error }}</div>
    <div v-else-if="loading" class="loading">Cargando {$name}...</div>
    <template v-else-if="entity">
      <div class="detail-header">
        <h2><router-link to="/{$pathKey}" class="back-btn-title">⬅️</router-link> {{ entity.ref || 'ID #'+entity.id }}</h2>
        <span class="badge">{{ entity.ref }}</span>
      </div>
      <TabBar :tabs="tabs" />
      <div class="tab-content"><router-view /></div>
    </template>
  </div>
</template>
VUE;

    file_put_contents($dirPath . '/' . $name . 'DetailView.vue', $detailView);
}
echo "Scaffolding completo.";
