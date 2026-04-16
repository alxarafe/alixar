<script setup lang="ts">
defineProps<{
  modelValue: any
  field: any
}>()
defineEmits<{
  (e: 'update:modelValue', value: any): void
}>()
</script>

<template>
  <select
    :id="field.key"
    :value="modelValue"
    @change="$emit('update:modelValue', ($event.target as HTMLSelectElement).value)"
    class="form-control"
    :required="field.required"
  >
    <option value="" disabled selected v-if="!modelValue">Seleccione una opción...</option>
    <option v-for="opt in field.options" :key="opt.value" :value="opt.value">
      {{ opt.label }}
    </option>
  </select>
</template>

<style scoped>
.form-control {
  width: 100%;
  box-sizing: border-box;
  background: rgba(0, 0, 0, 0.2);
  border: 1px solid rgba(255, 255, 255, 0.1);
  color: #fff;
  padding: 10px 15px;
  border-radius: 8px;
  font-family: inherit;
  font-size: 0.95rem;
  outline: none;
  transition: border 0.3s;
  cursor: pointer;
}
.form-control:focus {
  border-color: var(--primary-color, #a855f7);
}
.form-control option {
  background: #1e293b;
  color: #fff;
}
</style>
