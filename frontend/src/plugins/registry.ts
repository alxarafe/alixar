import type { PluginDefinition } from '../core/types'

// Import all plugin definitions here
import { ticketsPlugin } from './crm/tickets.plugin'
import { categoriesPlugin } from './crm/categories.plugin'
import { contractsPlugin } from './trading/contracts.plugin'
import { supplierProposalsPlugin } from './trading/supplierProposals.plugin'

// Mantenemos una lista plana de todos los modulos registrados
export const pluginsRegistry: PluginDefinition[] = [
  ...[ticketsPlugin, categoriesPlugin, contractsPlugin, supplierProposalsPlugin]
]
