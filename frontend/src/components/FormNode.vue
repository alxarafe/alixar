<script setup lang="ts">
import StringInput from './inputs/StringInput.vue'
import NumberInput from './inputs/NumberInput.vue'
import SelectInput from './inputs/SelectInput.vue'
import DateInput from './inputs/DateInput.vue'

defineProps<{
  node: any
  modelValue: Record<string, any>
}>()

const getComponentForType = (type: string) => {
  switch (type) {
    case 'number': return NumberInput;
    case 'select': return SelectInput;
    case 'date': return DateInput;
    case 'text':
    default:
      return StringInput;
  }
}
</script>

<template>
  <!-- Panel Component -->
  <template v-if="node.type === 'Panel'">
    <div class="glass-panel form-panel" :class="node.class">
      <h3 v-if="node.title" class="panel-title">{{ node.title }}</h3>
      <div class="panel-content">
        <FormNode
          v-for="(child, idx) in node.children"
          :key="idx"
          :node="child"
          :modelValue="modelValue"
        />
      </div>
    </div>
  </template>

  <!-- Row Component -->
  <template v-else-if="node.type === 'Row'">
    <div class="form-row" :class="node.class">
      <FormNode
        v-for="(child, idx) in node.children"
        :key="idx"
        :node="child"
        :modelValue="modelValue"
      />
    </div>
  </template>

  <!-- Field Component -->
  <template v-else-if="node.type === 'Field'">
    <div class="input-wrapper" :class="node.class">
      <label v-if="node.label" :for="node.key" class="form-label">
        {{ node.label }}
        <span v-if="node.required" class="required-mark">*</span>
      </label>
      <component 
        :is="getComponentForType(node.inputType)"
        :field="node"
        v-model="modelValue[node.key]"
      />
    </div>
  </template>
</template>

<style scoped>
.form-panel {
  padding: 1.5rem;
  margin-bottom: 1.5rem;
  border-radius: 12px;
  background: rgba(255, 255, 255, 0.03);
  border: 1px solid rgba(255, 255, 255, 0.08);
}
.panel-title {
  margin-top: 0;
  margin-bottom: 1.25rem;
  font-size: 1.15rem;
  color: #fff;
  border-bottom: 1px solid rgba(255, 255, 255, 0.1);
  padding-bottom: 0.75rem;
}
.panel-content {
  display: flex;
  flex-direction: column;
  gap: 1.5rem;
}
.form-row {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
  gap: 1.5rem;
  width: 100%;
}
.input-wrapper {
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
  width: 100%;
}
.form-label {
  font-size: 0.85rem;
  font-weight: 500;
  color: rgba(255, 255, 255, 0.85);
}
.required-mark {
  color: #f87171;
  margin-left: 2px;
}
</style>
