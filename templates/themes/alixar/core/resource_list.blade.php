<div class="alixar-table-container">
    <div class="table-responsive">
        <table class="table table-hover align-middle custom-table">
            <thead>
                <tr>
                    @foreach($config['list']['columns'] as $column)
                        <th class="py-3 px-4">{{ is_array($column) ? ($column['label'] ?? $column['field']) : $column->getLabel() }}</th>
                    @endforeach
                    <th class="text-end py-3 px-4">Acciones</th>
                </tr>
            </thead>
            <tbody>
                @forelse($data['items'] as $item)
                    <tr>
                        @foreach($config['list']['columns'] as $column)
                            @php
                                $field = is_array($column) ? $column['field'] : $column->getField();
                                $value = data_get($item, $field);
                            @endphp
                            <td class="px-4">
                                @if(isset($column['type']) && $column['type'] === 'boolean')
                                    <span class="badge {{ $value ? 'bg-success' : 'bg-secondary' }}">
                                        {{ $value ? 'SÍ' : 'NO' }}
                                    </span>
                                @else
                                    {{ $value }}
                                @endif
                            </td>
                        @endforeach
                        <td class="text-end px-4">
                            <div class="d-flex justify-content-end gap-2">
                                <a href="?module={{ $me::getModuleName() }}&controller={{ $me::getControllerName() }}&id={{ $item->rowid }}" 
                                   class="btn btn-sm btn-light border" title="Editar">
                                    <i class="fas fa-edit text-primary"></i>
                                </a>
                                <button class="btn btn-sm btn-light border text-danger" 
                                        onclick="if(confirm('¿Seguro?')) window.location.href='?module={{ $me::getModuleName() }}&controller={{ $me::getControllerName() }}&action=delete&id={{ $item->id }}'"
                                        title="Eliminar">
                                    <i class="fas fa-trash-alt"></i>
                                </button>
                            </div>
                        </td>
                    </tr>
                @empty
                    <tr>
                        <td colspan="{{ count($config['list']['columns']) + 1 }}" class="text-center py-5 text-muted">
                            <i class="fas fa-search fa-3x mb-3 opacity-25"></i>
                            <p>No se encontraron registros.</p>
                        </td>
                    </tr>
                @endforelse
            </tbody>
        </table>
    </div>

    @if($data['total'] > count($data['items']))
        <div class="alixar-pagination mt-4 d-flex justify-content-between align-items-center bg-light p-3 rounded-3">
            <span class="small text-muted">Mostrando {{ count($data['items']) }} de {{ $data['total'] }} registros</span>
            <!-- Paginación básica -->
        </div>
    @endif
</div>

<style>
.custom-table { border-collapse: separate; border-spacing: 0 8px; margin-top: -8px; }
.custom-table tr { box-shadow: 0 2px 10px rgba(0,0,0,0.02); background: white; border-radius: 8px; }
.custom-table thead th { border-bottom: none; font-weight: 700; color: #64748b; font-size: 0.8rem; text-transform: uppercase; letter-spacing: 0.5px; }
.custom-table tbody td { border-top: 1px solid #f1f5f9; border-bottom: 1px solid #f1f5f9; padding: 1rem; }
.custom-table tbody td:first-child { border-left: 1px solid #f1f5f9; border-top-left-radius: 8px; border-bottom-left-radius: 8px; }
.custom-table tbody td:last-child { border-right: 1px solid #f1f5f9; border-top-right-radius: 8px; border-bottom-right-radius: 8px; }
</style>
