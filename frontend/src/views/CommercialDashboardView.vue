<script setup lang="ts">
import MetricWidget from '../components/widgets/MetricWidget.vue'
import LatestListWidget from '../components/widgets/LatestListWidget.vue'
</script>

<template>
  <div class="view-container dashboard">
    <div class="header-action">
      <h2>Área Comercial</h2>
    </div>

    <div class="metrics-row">
      <MetricWidget resource="facturas" />
      <MetricWidget resource="pedidos" />
      <MetricWidget resource="presupuestos" />
    </div>

    <div class="widgets-grid">
      <LatestListWidget resource="facturas" :limit="7" />
      <LatestListWidget resource="pedidos" :limit="7" />
      <LatestListWidget resource="presupuestos" :limit="7" />
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
.header-action {
  margin-bottom: 0.5rem;
  border-bottom: 1px solid rgba(255, 255, 255, 0.1);
  padding-bottom: 0.5rem;
}
.header-action h2 {
  font-size: 1.7rem;
  color: #fff;
  margin: 0;
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
