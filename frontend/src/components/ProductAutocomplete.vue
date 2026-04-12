<script setup lang="ts">
import { ref, watch, onMounted, onUnmounted } from 'vue'
import { api, type Product } from '../api'

const props = defineProps<{
  modelValue: string
}>()

const emit = defineEmits<{
  (e: 'update:modelValue', val: string): void
  (e: 'product-selected', val: Product): void
}>()

const query = ref(props.modelValue)
const results = ref<Product[]>([])
const loading = ref(false)
const showDropdown = ref(false)
const isDropup = ref(false)
let debounceTimeout: any = null

const containerRef = ref<HTMLElement | null>(null)

const checkPosition = () => {
  if (!containerRef.value) return
  const rect = containerRef.value.getBoundingClientRect()
  const spaceBelow = window.innerHeight - rect.bottom
  isDropup.value = spaceBelow < 280 // if there is less than 280px below, open upwards
}

watch(showDropdown, (val) => {
  if (val) checkPosition()
})

// Sync from parent (if parent clears input or sets it externally)
watch(() => props.modelValue, (newVal) => {
  if (newVal !== query.value) {
    query.value = newVal
  }
})

// Search logic
watch(query, (val) => {
  emit('update:modelValue', val) // Always emit pure text to keep model alive
  
  if (val.length < 3) {
    results.value = []
    showDropdown.value = false
    return
  }
  
  clearTimeout(debounceTimeout)
  debounceTimeout = setTimeout(async () => {
    try {
      loading.value = true
      // API request searching by Ref or Label
      // Dolibarr's sqlfilters parser has known bugs with 'OR', so we perform two parallel specific requests and merge.
      const [byRef, byLabel] = await Promise.all([
        api.getProducts({ limit: 10, sqlfilters: `(t.ref:like:'%${val}%')` }),
        api.getProducts({ limit: 10, sqlfilters: `(t.label:like:'%${val}%')` })
      ])
      
      const merged = [...byRef, ...byLabel]
      // deduplicate by id
      const uniqueMap = new Map()
      merged.forEach(p => uniqueMap.set(p.id, p))
      
      const products = Array.from(uniqueMap.values()).slice(0, 10)
      
      results.value = products
      showDropdown.value = products.length > 0
    } catch (e) {
      console.error("Autocomplete error:", e)
    } finally {
      loading.value = false
    }
  }, 350) // 350ms debounce
})

const selectProduct = (product: Product) => {
  query.value = product.label || product.ref // Put visually in input
  showDropdown.value = false
  emit('product-selected', product)
}

// Close Dropdown on outside click
const clickOutside = (e: MouseEvent) => {
  if (containerRef.value && !containerRef.value.contains(e.target as Node)) {
    showDropdown.value = false
  }
}

onMounted(() => document.addEventListener('click', clickOutside))
onUnmounted(() => document.removeEventListener('click', clickOutside))

</script>

<template>
  <div class="autocomplete-container" ref="containerRef">
    <input 
      type="text" 
      v-model="query" 
      class="line-input" 
      placeholder="Entrada de texto libre o buscar artículo..."
      @focus="query.length >= 3 && results.length > 0 ? (showDropdown = true) : null"
    />
    
    <div class="dropdown-list glass-panel" :class="{ 'dropup': isDropup }" v-if="showDropdown">
      <div v-if="loading" class="dropdown-item spinner-msg">Buscando...</div>
      <div 
        v-for="item in results" 
        :key="item.id" 
        class="dropdown-item"
        @click="selectProduct(item)"
      >
        <span class="ref-badge">{{ item.ref }}</span>
        <span class="item-label">{{ item.label }}</span>
        <span class="item-price">{{ (item.price ?? 0).toFixed(2) }}€</span>
      </div>
    </div>
  </div>
</template>

<style scoped>
.autocomplete-container {
  position: relative;
  width: 100%;
}
.dropdown-list {
  position: absolute;
  top: calc(100% + 4px);
  left: 0;
  width: 100%;
  max-height: 250px;
  overflow-y: auto;
  z-index: 100;
  background: #1e1e2d; /* Deep dark with fallback */
  border-radius: 8px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.4);
  border: 1px solid rgba(255, 255, 255, 0.1);
  display: flex;
  flex-direction: column;
}
.dropdown-list.dropup {
  top: auto;
  bottom: calc(100% + 4px);
  box-shadow: 0 -4px 12px rgba(0, 0, 0, 0.4);
}
.dropdown-item {
  padding: 0.75rem 1rem;
  display: flex;
  align-items: center;
  gap: 0.75rem;
  cursor: pointer;
  border-bottom: 1px solid rgba(255, 255, 255, 0.05);
  transition: background 0.2s;
}
.dropdown-item:last-child {
  border-bottom: none;
}
.dropdown-item:hover {
  background: rgba(255, 255, 255, 0.15);
}
.ref-badge {
  font-size: 0.75rem;
  background: rgba(168, 85, 247, 0.2);
  color: #c084fc;
  padding: 2px 6px;
  border-radius: 4px;
  font-weight: 600;
}
.item-label {
  flex: 1;
  color: #fff;
  font-size: 0.9rem;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}
.item-price {
  font-size: 0.85rem;
  color: rgba(255, 255, 255, 0.6);
  font-weight: 500;
}
.spinner-msg {
  justify-content: center;
  color: rgba(255, 255, 255, 0.5);
  font-size: 0.85rem;
  padding: 1rem;
}
</style>
