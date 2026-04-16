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
  <input
    :id="field.key"
    type="text"
    :value="modelValue"
    @input="$emit('update:modelValue', ($event.target as HTMLInputElement).value)"
    class="form-control"
    :placeholder="field.placeholder || ''"
    :required="field.required"
  />
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
}
.form-control:focus {
  border-color: var(--primary-color, #a855f7);
}
</style>
