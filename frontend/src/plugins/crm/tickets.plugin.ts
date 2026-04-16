import type { PluginDefinition } from '../../core/types'

const extractExtrafields = (e: any) => {
  if (!e.array_options) return [];
  return Object.entries(e.array_options)
    .filter(([_, v]) => v !== null && v !== '')
    .map(([k, v]) => ({
      label: k.replace(/^options_/, '').replace(/_/g, ' ').replace(/\b\w/g, l => l.toUpperCase()),
      value: String(v)
    }));
};

export const ticketsPlugin: PluginDefinition = {
  key: 'tickets',
  endpoint: '/tickets',
  icon: '🎫',
  labels: {
    plural: 'Gestión de Tickets',
    singular: 'Ticket'
  },
  columns: [
    { key: 'ref', label: 'Referencia' },
    { key: 'subject', label: 'Asunto' },
    { key: 'status_code', label: 'Estado' }
  ],
  fields: (e: any) => [
    { label: 'Referencia', value: e.ref, type: 'badge' },
    { label: 'Asunto', value: e.subject },
    { label: 'Tercero', value: e.socname || (e.fk_soc ? `#${e.fk_soc}` : undefined) },
    { label: 'Severidad', value: e.severity },
    { label: 'Tipo', value: e.type_code },
    { label: 'Estado', value: e.status_code },
    ...extractExtrafields(e)
  ]
}
