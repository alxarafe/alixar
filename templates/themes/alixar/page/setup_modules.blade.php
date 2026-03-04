@extends('partial.layout.main')

@section('content')
<div class="container-fluid py-4 animate__animated animate__fadeIn">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="alixar-page-title m-0">
            <i class="fas fa-cubes me-2 text-primary"></i> Módulos de Dolibarr
        </h2>
        <a href="{{ $me::url('doIndex') }}" class="btn btn-outline-secondary btn-sm">
            <i class="fas fa-chevron-left me-1"></i> Volver al asistente
        </a>
    </div>

    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
        @foreach($modules as $id => $module)
            <div class="col">
                <div class="card h-100 alixar-glass-container border-0 transition-transform {{ $module['active'] ? 'border-start border-success border-4' : '' }}">
                    <div class="card-body p-4">
                        <div class="d-flex justify-content-between align-items-start mb-3">
                            <div class="module-icon-bg bg-{{ $module['active'] ? 'success' : 'light' }} rounded-circle d-flex align-items-center justify-content-center" style="width: 50px; height: 50px;">
                                <i class="fas fa-box fa-lg text-{{ $module['active'] ? 'white' : 'muted' }}"></i>
                            </div>
                            <div class="form-check form-switch p-0 m-0">
                                <input class="form-check-input ms-0 scale-150" type="checkbox" role="switch" id="switch-{{ $module['name'] }}" 
                                    {{ $module['active'] ? 'checked' : '' }}
                                    onclick="window.location.href='{{ $me::url($module['active'] ? 'doDeactivateModule' : 'doActivateModule', ['name' => $module['name']]) }}'">
                            </div>
                        </div>
                        
                        <h5 class="card-title fw-bold mb-1">{{ $module['name'] }}</h5>
                        <div class="badge bg-light text-muted mb-3 border">{{ strtoupper($module['family']) }}</div>
                        
                        <p class="card-text text-muted small" style="min-height: 3rem;">
                            {{ $module['description'] }}
                        </p>
                    </div>
                    
                    @if($module['active'])
                        <div class="card-footer bg-transparent border-0 pt-0 pb-3 px-4">
                            <div class="d-flex align-items-center text-success small fw-bold">
                                <i class="fas fa-check-circle me-1"></i> Activo
                            </div>
                        </div>
                    @endif
                </div>
            </div>
        @endforeach
    </div>
</div>

<style>
    .transition-transform { transition: all 0.3s ease; }
    .transition-transform:hover { transform: translateY(-5px); }
    .scale-150 { transform: scale(1.4); cursor: pointer; }
    .module-icon-bg { box-shadow: 0 4px 10px rgba(0,0,0,0.05); }
    .card { background: white !important; } /* Sobreescribir glass para legibilidad en lista */
</style>
@endsection
