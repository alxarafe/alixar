<script setup lang="ts">
import MetricWidget from '../components/widgets/MetricWidget.vue'
import LatestListWidget from '../components/widgets/LatestListWidget.vue'
</script>

<template>
  <div class="view-container dashboard">
    <div class="metrics-row">
      <MetricWidget resource="terceros" />
      <MetricWidget resource="contactos" />
      <MetricWidget resource="productos" />
    </div>

    <div class="widgets-grid">
      <LatestListWidget resource="terceros" :limit="5" />
      <LatestListWidget resource="contactos" :limit="5" />
      <LatestListWidget resource="productos" :limit="5" />
    </div>
  </div>
</template>

<style scoped>
.dashboard {
  display: flex;
  flex-direction: column;
  gap: 2rem;
  padding: 1.5rem;
}
.metrics-row {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
  gap: 1.5rem;
}
.widgets-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
  gap: 1.5rem;
  align-items: start;
}
</style>
