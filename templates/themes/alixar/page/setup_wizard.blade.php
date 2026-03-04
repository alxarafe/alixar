@extends('partial.layout.main')

@section('content')
<div class="container-fluid py-5 animate__animated animate__fadeIn">
    <div class="row justify-content-center">
        <div class="col-xl-9 col-lg-10">
            <div class="alixar-glass-container border-0 shadow-lg p-0 overflow-hidden mb-5">
                <div class="p-5 text-center bg-primary bg-gradient text-white">
                    <div class="mb-4">
                        <i class="fas fa-magic fa-4x opacity-75"></i>
                    </div>
                    <h2 class="display-6 fw-bold mb-3">Configuración de Alixar</h2>
                    <p class="lead opacity-75 mb-0">Bienvenido al asistente de configuración. Sigue estos pasos para poner en marcha tu ERP.</p>
                </div>

                <div class="p-5 bg-white bg-opacity-50">
                    <div class="row g-4">
                        @foreach($steps as $id => $step)
                            <div class="col-md-4">
                                <div class="card h-100 border-0 shadow-sm rounded-4 text-center overflow-hidden transition-all hover-lift">
                                    <div class="card-body p-4">
                                        <div class="mb-4">
                                            <div class="rounded-circle bg-{{ $step['completed'] ? 'success' : 'light' }} d-inline-flex align-items-center justify-content-center" style="width: 70px; height: 70px;">
                                                <i class="{{ $step['icon'] }} fa-2x text-{{ $step['completed'] ? 'white' : 'primary' }}"></i>
                                            </div>
                                        </div>
                                        <h5 class="fw-bold mb-2">{{ $step['label'] }}</h5>
                                        <p class="text-muted small mb-4" style="min-height: 3rem;">{{ $step['description'] }}</p>
                                        
                                        <a href="{{ $step['url'] }}" 
                                           class="btn w-100 py-2 fw-bold {{ $step['completed'] ? 'btn-outline-success' : 'btn-primary shadow-sm' }}">
                                            @if($step['completed'])
                                                <i class="fas fa-check-circle me-2"></i> Completado
                                            @else
                                                <i class="fas fa-cog me-2"></i> Configurar
                                            @endif
                                        </a>
                                    </div>
                                    @if($step['completed'])
                                        <div class="card-footer bg-success border-0 py-1"></div>
                                    @endif
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>

            <div class="text-center">
                <p class="small text-muted mb-4">Alixar utiliza la base de datos de Dolibarr, por lo que tus datos están seguros y son compatibles.</p>
                <div class="d-flex justify-content-center gap-3">
                    <a href="index.php?module=Alixar&controller=Dashboard" class="btn btn-link text-decoration-none text-secondary small">
                        <i class="fas fa-arrow-left me-1"></i> Ir al Panel Central
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
.hover-lift { transition: all 0.3s cubic-bezier(0.165, 0.84, 0.44, 1); }
.hover-lift:hover { transform: translateY(-8px); box-shadow: 0 15px 35px rgba(0,0,0,0.1) !important; }
.bg-primary.bg-gradient { background: linear-gradient(135deg, var(--alixar-primary) 0%, var(--alixar-secondary) 100%) !important; }
</style>
@endsection
