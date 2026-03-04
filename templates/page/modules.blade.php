@extends('partial.layout.main')

@section('content')
<div class="container-fluid py-4 animate__animated animate__fadeIn">
    <div class="row mb-4 align-items-center">
        <div class="col-md-7">
            <h1 class="alixar-page-title mb-1">
                <i class="fas fa-puzzle-piece me-2 text-primary"></i> {{ $title ?? 'Gestión de Módulos' }}
            </h1>
            <p class="text-muted lead mb-0">
                Activa o desactiva las extensiones del sistema. Las dependencias se gestionan automáticamente.
            </p>
        </div>
        <div class="col-md-5 text-md-end mt-3 mt-md-0">
            <button class="btn btn-outline-danger me-2" onclick="bulkAction('disableAll')">
                <i class="fas fa-power-off me-1"></i> Desactivar todo
            </button>
            <button class="btn btn-outline-success" onclick="bulkAction('enableAll')">
                <i class="fas fa-check-double me-1"></i> Activar todo
            </button>
        </div>
    </div>

    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
        @foreach($modules as $module)
        <div class="col">
            <div class="alixar-card p-4 h-100 transition-all {{ $module['enabled'] ? '' : 'opacity-50' }}">
                <div class="d-flex justify-content-between align-items-start mb-3">
                    <div>
                        <h5 class="fw-bold mb-1">
                            <i class="{{ $module['icon'] ?? 'fas fa-puzzle-piece' }} me-2 text-primary"></i>
                            {{ $module['name'] }}
                        </h5>
                        @if(!empty($module['description']))
                        <p class="text-muted small mb-1">{{ $module['description'] }}</p>
                        @endif
                        @if(!empty($module['requires']))
                        <small class="text-muted"><i class="fas fa-link me-1"></i>Depende de: {{ implode(', ', $module['requires']) }}</small>
                        @endif
                    </div>
                    <div class="d-flex align-items-center gap-2">
                        @if($module['setup_url'] && $module['enabled'])
                        <a href="{{ $module['setup_url'] }}" class="btn btn-sm btn-outline-secondary" title="Configurar">
                            <i class="fas fa-cog"></i>
                        </a>
                        @endif
                        @if($module['is_core'])
                        <span class="badge bg-success-soft text-success">Core</span>
                        @else
                        <div class="form-check form-switch scale-150">
                            <input
                                class="form-check-input"
                                type="checkbox"
                                role="switch"
                                id="module_{{ $module['name'] }}"
                                {{ $module['enabled'] ? 'checked' : '' }}
                                onchange="toggleModule('{{ $module['name'] }}')"
                            >
                        </div>
                        @endif
                    </div>
                </div>
                <div class="d-flex justify-content-between align-items-center mt-2">
                    <span class="badge {{ $module['namespace'] === 'CoreModules' ? 'bg-primary' : 'bg-secondary' }}">
                        {{ $module['namespace'] }}
                    </span>
                    @if(!empty($module['dependents']))
                    <small class="text-warning" title="Estos módulos dependen de este: {{ implode(', ', $module['dependents']) }}">
                        <i class="fas fa-exclamation-triangle me-1"></i>{{ count($module['dependents']) }} dependiente(s)
                    </small>
                    @endif
                </div>
            </div>
        </div>
        @endforeach
    </div>
</div>

<script>
function toggleModule(name) {
    doToggle(name, false);
}

function doToggle(name, force) {
    const url = 'index.php?module=Admin&controller=Module&action=toggle';
    const body = 'module=' + encodeURIComponent(name) + (force ? '&force=1' : '');
    
    fetch(url, {
        method: 'POST',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        body: body
    })
    .then(response => response.json())
    .then(data => {
        if (data.status === 'confirm_cascade') {
            if (confirm('Desactivar "' + name + '" también desactivará:\n\n• ' + data.dependents.join('\n• ') + '\n\n¿Desea continuar?')) {
                doToggle(name, true);
            } else {
                window.location.reload();
            }
        } else if (data.status === 'confirm_enable_deps') {
            if (confirm('Activar "' + name + '" requiere activar también:\n\n• ' + data.missing_deps.join('\n• ') + '\n\n¿Desea activarlos?')) {
                doToggle(name, true);
            } else {
                window.location.reload();
            }
        } else if (data.status === 'success') {
            window.location.reload();
        } else {
            alert(data.message || 'Error al cambiar estado del módulo');
            window.location.reload();
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('Error de conexión');
        window.location.reload();
    });
}

function bulkAction(action) {
    const msg = action === 'disableAll' 
        ? '¿Desactivar TODOS los módulos opcionales?' 
        : '¿Activar TODOS los módulos?';
    if (!confirm(msg)) return;
    
    fetch('index.php?module=Admin&controller=Module&action=' + action, { method: 'POST' })
    .then(response => response.json())
    .then(data => {
        if (data.status === 'success') {
            window.location.reload();
        } else {
            alert(data.message || 'Error en la acción masiva');
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('Error de conexión');
    });
}
</script>

<style>
.bg-success-soft { background-color: rgba(var(--bs-success-rgb), 0.1) !important; }
.scale-150 { transform: scale(1.4); cursor: pointer; }
.alixar-card {
    background: var(--card-bg, white);
    border-radius: 12px;
    border: 1px solid var(--border-color, rgba(0,0,0,0.1));
    box-shadow: 0 4px 12px rgba(0,0,0,0.05);
}
.alixar-card:hover {
    transform: translateY(-3px);
    box-shadow: 0 8px 15px rgba(0,0,0,0.1);
}
.transition-all {
    transition: all 0.2s ease-in-out;
}
</style>
@endsection
