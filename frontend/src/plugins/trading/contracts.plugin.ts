import type { PluginDefinition } from '../../core/types'

export const contractsPlugin: PluginDefinition = {
  key: 'contracts',
  endpoint: '/contracts',
  icon: '📄',
  labels: {
    plural: 'Contratos',
    singular: 'Contrato'
  },
  columns: [
    { key: 'ref', label: 'Referencia', type: 'badge' },
    { key: 'date_contrat', label: 'Fecha' },
    { key: 'socname', label: 'Cliente/Tercero' }
  ],
  fields: (e: any) => [
    { label: 'Referencia', value: e.ref, type: 'badge' },
    { label: 'Tercero', value: e.socname || (e.fk_soc ? `#${e.fk_soc}` : undefined) },
    { label: 'Fecha Contrato', value: e.date_contrat ? new Date(e.date_contrat).toLocaleDateString('es-ES') : undefined },
    { label: 'Estado', value: e.statut !== undefined ? e.statut.toString() : undefined }
  ]
}
