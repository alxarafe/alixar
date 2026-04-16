import type { PluginDefinition } from '../../core/types'

export const supplierProposalsPlugin: PluginDefinition = {
  key: 'supplier-proposals',
  endpoint: '/supplierproposals',
  icon: '🤝',
  labels: {
    plural: 'Presupuestos de Proveedor',
    singular: 'Presupuesto'
  },
  columns: [
    { key: 'ref', label: 'Referencia', type: 'badge' },
    { key: 'socname', label: 'Proveedor' },
    { key: 'total_ht', label: 'Total HT', format: (v: number) => v ? `${Number(v).toFixed(2)} €` : '—' }
  ],
  fields: (e: any) => [
    { label: 'Referencia', value: e.ref, type: 'badge' },
    { label: 'Ref. Proveedor', value: e.ref_supplier },
    { label: 'Proveedor', value: e.socname || (e.fk_soc ? `#${e.fk_soc}` : undefined) },
    { label: 'Fecha Propuesta', value: e.datep ? new Date(e.datep).toLocaleDateString('es-ES') : undefined },
    { label: 'Total HT', value: e.total_ht ? `${Number(e.total_ht).toFixed(2)} €` : undefined },
    { label: 'Total TTC', value: e.total_ttc ? `${Number(e.total_ttc).toFixed(2)} €` : undefined }
  ]
}
