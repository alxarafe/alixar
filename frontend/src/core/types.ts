import type { InfoField } from '../components/InfoCard.vue'
import type { Column } from '../components/EntityList.vue'

export interface PluginDefinition {
  key: string
  endpoint: string
  icon?: string
  labels: {
    plural: string
    singular: string
  }
  columns: Column[]
  fields: (entity: any) => InfoField[]
  tabs?: TabDefinition[]
}

export interface TabDefinition {
  key: string
  label: string
  icon: string
  componentName: string
}
