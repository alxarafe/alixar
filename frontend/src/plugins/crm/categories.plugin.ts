import type { PluginDefinition } from '../../core/types'

export const categoriesPlugin: PluginDefinition = {
  key: 'categories',
  endpoint: '/categories',
  icon: '🏷️',
  labels: {
    plural: 'Categorías y Etiquetas',
    singular: 'Categoría'
  },
  columns: [
    { key: 'id', label: 'ID', format: (v: number) => `#${v}` },
    { key: 'label', label: 'Etiqueta' },
    { key: 'type', label: 'Tipo' }
  ],
  fields: (e: any) => [
    { label: 'Etiqueta', value: e.label, type: 'badge' },
    { label: 'Tipo', value: e.type ? e.type.toString() : 'Genérico' },
    { label: 'Descripción', value: e.description },
    { label: 'Color', value: e.color }
  ]
}
