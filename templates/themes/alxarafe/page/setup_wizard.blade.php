@extends('partial.layout.main')

@section('content')
<div class="container-fluid py-4">
    <div class="row justify-content-center">
        <div class="col-md-10">
            <x-component.card class="mb-4">
                <x-slot:header_slot class="bg-primary text-white d-flex align-items-center py-3">
                    <i class="fas fa-magic me-3 fa-lg"></i>
                    <h5 class="mb-0">Configuración Inicial Alixar</h5>
                </x-slot:header_slot>

                <div class="p-4">
                    @if($socName)
                        <x-component.alert type="success" class="d-flex align-items-center mb-4">
                            <i class="fas fa-check-circle me-3 fa-2x"></i>
                            <div>
                                ¡Bienvenido! La organización <strong>{{ $socName }}</strong> ha sido configurada correctamente.
                            </div>
                        </x-component.alert>
                    @else
                        <x-component.alert type="info" class="d-flex align-items-center mb-4">
                            <i class="fas fa-info-circle me-3 fa-2x"></i>
                            <div>
                                <strong>Paso indispensable:</strong> Todavía no has configurado los datos de tu empresa. Por favor, completa los pasos a continuación para empezar a usar Alixar.
                            </div>
                        </x-component.alert>
                    @endif

                    <div class="row">
                        @foreach($steps as $id => $step)
                            <div class="col-md-4 mb-4">
                                <x-component.card class="h-100 border-{{ $step['completed'] ? 'success' : 'light' }}">
                                    <div class="text-center p-4">
                                        <div class="mb-4">
                                            <div class="rounded-circle bg-{{ $step['completed'] ? 'success' : 'light' }} d-inline-flex align-items-center justify-content-center" style="width: 80px; height: 80px;">
                                                <i class="{{ $step['icon'] }} fa-2x text-{{ $step['completed'] ? 'white' : 'primary' }}"></i>
                                            </div>
                                        </div>
                                        <h5 class="card-title fw-bold mb-3">{{ $step['label'] }}</h5>
                                        <p class="card-text text-muted mb-4">{{ $step['description'] }}</p>
                                        
                                        <x-component.button 
                                            href="{{ $step['url'] }}" 
                                            type="{{ $step['completed'] ? 'outline-success' : 'primary' }}" 
                                            class="w-100"
                                            tag="link"
                                        >
                                            @if($step['completed'])
                                                <i class="fas fa-sync-alt me-2"></i> Cambiar
                                            @else
                                                <i class="fas fa-arrow-right me-2"></i> Configurar
                                            @endif
                                        </x-component.button>
                                    </div>
                                    @if($step['completed'])
                                        <x-slot:footer_slot class="bg-success text-white py-2 text-center border-0">
                                            <small class="fw-bold"><i class="fas fa-check-circle me-1"></i> LISTO</small>
                                        </x-slot:footer_slot>
                                    @endif
                                </x-component.card>
                            </div>
                        @endforeach
                    </div>
                </div>
            </x-component.card>
            
            <div class="text-center mt-2">
                <p class="text-muted small mb-3">Este asistente te guía por las configuraciones mínimas recomendadas al estilo Dolibarr.</p>
                <x-component.button href="index.php?module=Alixar&controller=Dashboard&action=index" type="link" class="text-secondary text-decoration-none">
                    <i class="fas fa-chevron-left me-1"></i> Volver al Panel de Control
                </x-component.button>
            </div>
        </div>
    </div>
</div>

<style>
    .card { transition: transform 0.2s; border-radius: 12px; }
    .card:hover { transform: translateY(-5px); }
    .btn { border-radius: 8px; font-weight: 500; }
    .alert { border-radius: 12px; border: none; }
    .bg-primary { background: linear-gradient(45deg, #0d6efd, #0b5ed7) !important; }
</style>
@endsection
