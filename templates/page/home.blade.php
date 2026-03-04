@extends('partial.layout.main')

@section('content')
<div class="dashboard-wrapper">
    <div class="row g-4 mb-4">
        <div class="col-12">
            <h1 class="alixar-page-title mb-1 animate__animated animate__fadeInDown">
                Panel de Control <span class="text-primary">{{ \Alxarafe\Base\Config::getConfig()->main->appName ?? 'Alixar' }}</span>
            </h1>
            <p class="text-muted lead animate__animated animate__fadeIn animate__delay-1s">
                Resumen operativo de tu organización en tiempo real.
            </p>
        </div>
    </div>

    <!-- Stats Grid -->
    <div class="row g-4 mb-4">
        <div class="col-md-3 animate__animated animate__zoomIn animate__delay-1s">
            <div class="alixar-card p-4 transition-all">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <div class="stat-icon bg-primary-soft text-primary p-3 rounded-3">
                        <i class="fas fa-users fa-lg"></i>
                    </div>
                </div>
                <h3 class="fw-bold mb-1">{{ $stats['thirdparties'] ?? 0 }}</h3>
                <p class="text-muted small mb-0">Terceros registrados</p>
            </div>
        </div>
        <div class="col-md-3 animate__animated animate__zoomIn animate__delay-1s" style="animation-delay: 1.1s">
            <div class="alixar-card p-4 transition-all">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <div class="stat-icon bg-success-soft text-success p-3 rounded-3">
                        <i class="fas fa-boxes fa-lg"></i>
                    </div>
                </div>
                <h3 class="fw-bold mb-1">{{ $stats['products'] ?? 0 }}</h3>
                <p class="text-muted small mb-0">Productos & Servicios</p>
            </div>
        </div>
        <div class="col-md-3 animate__animated animate__zoomIn animate__delay-1s" style="animation-delay: 1.2s">
            <div class="alixar-card p-4 transition-all">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <div class="stat-icon bg-warning-soft text-warning p-3 rounded-3">
                        <i class="fas fa-shopping-basket fa-lg"></i>
                    </div>
                </div>
                <h3 class="fw-bold mb-1">{{ $stats['orders'] ?? 0 }}</h3>
                <p class="text-muted small mb-0">Pedidos en curso</p>
            </div>
        </div>
        <div class="col-md-3 animate__animated animate__zoomIn animate__delay-1s" style="animation-delay: 1.3s">
            <div class="alixar-card p-4 transition-all">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <div class="stat-icon bg-danger-soft text-danger p-3 rounded-3">
                        <i class="fas fa-file-invoice-dollar fa-lg"></i>
                    </div>
                </div>
                <h3 class="fw-bold mb-1">{{ $stats['invoices'] ?? 0 }}</h3>
                <p class="text-muted small mb-0">Facturas por cobrar</p>
            </div>
        </div>
    </div>

    <!-- Activity Grid -->
    <div class="row g-4 mb-4">
        <!-- Recent Third Parties -->
        <div class="col-md-6">
            <div class="alixar-card p-4">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h5 class="fw-bold mb-0">Últimos Terceros</h5>
                    <a href="index.php?module=CRM&controller=ThirdParty&action=index" class="btn btn-sm btn-outline-primary">Ver todos</a>
                </div>
                <div class="table-responsive">
                    <table class="table table-hover align-middle mb-0">
                        <thead>
                            <tr class="text-muted small">
                                <th>Nombre</th>
                                <th>Ciudad</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($recentThirdParties as $tp)
                            <tr>
                                <td>
                                    <a href="index.php?module=CRM&controller=ThirdParty&action=edit&id={{ $tp->rowid }}" class="text-decoration-none fw-medium">
                                        {{ $tp->nom }}
                                    </a>
                                </td>
                                <td>{{ $tp->town }}</td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- Pending Invoices -->
        <div class="col-md-6">
            <div class="alixar-card p-4">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h5 class="fw-bold mb-0 text-danger">Facturas Pendientes</h5>
                    <a href="index.php?module=Sales&controller=Invoice&action=index" class="btn btn-sm btn-outline-danger">Ver todas</a>
                </div>
                <div class="table-responsive">
                    <table class="table table-hover align-middle mb-0">
                        <thead>
                            <tr class="text-muted small">
                                <th>Ref.</th>
                                <th>Tercero</th>
                                <th class="text-end">Importe</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($pendingInvoices as $inv)
                            <tr>
                                <td>
                                    <a href="index.php?module=Sales&controller=Invoice&action=edit&id={{ $inv->rowid }}" class="text-decoration-none fw-medium text-danger">
                                        {{ $inv->ref }}
                                    </a>
                                </td>
                                <td class="small">{{ $inv->thirdParty->nom ?? '---' }}</td>
                                <td class="text-end fw-bold">{{ number_format($inv->total_ttc, 2, ',', '.') }} €</td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Shortcut Cards -->
    <div class="row g-4">
        <div class="col-md-4">
            <div class="alixar-card p-4 h-100">
                <h5 class="fw-bold mb-4 border-bottom pb-2">Acciones Rápidas</h5>
                <div class="list-group list-group-flush">
                    <a href="index.php?module=CRM&controller=ThirdParty&action=edit&id=new" class="list-group-item list-group-item-action border-0 px-0 py-2 d-flex align-items-center bg-transparent">
                        <div class="icon-circle-sm bg-light text-primary me-3">
                            <i class="fas fa-user-plus"></i>
                        </div>
                        Nuevo Tercero
                        <i class="fas fa-chevron-right ms-auto text-muted small"></i>
                    </a>
                    <a href="index.php?module=Sales&controller=Proposal&action=edit&id=new" class="list-group-item list-group-item-action border-0 px-0 py-2 d-flex align-items-center bg-transparent">
                        <div class="icon-circle-sm bg-light text-success me-3">
                            <i class="fas fa-file-invoice"></i>
                        </div>
                        Nuevo Presupuesto
                        <i class="fas fa-chevron-right ms-auto text-muted small"></i>
                    </a>
                    <a href="index.php?module=Sales&controller=Order&action=edit&id=new" class="list-group-item list-group-item-action border-0 px-0 py-2 d-flex align-items-center bg-transparent">
                        <div class="icon-circle-sm bg-light text-warning me-3">
                            <i class="fas fa-shopping-basket"></i>
                        </div>
                        Nuevo Pedido
                        <i class="fas fa-chevron-right ms-auto text-muted small"></i>
                    </a>
                </div>
            </div>
        </div>
        
        <div class="col-md-4">
            <div class="alixar-card p-4 h-100">
                <h5 class="fw-bold mb-4 border-bottom pb-2">Administración</h5>
                <div class="list-group list-group-flush">
                    <a href="index.php?module=Admin&controller=Module&action=index" class="list-group-item list-group-item-action border-0 px-0 py-2 d-flex align-items-center bg-transparent">
                        <div class="icon-circle-sm bg-light text-purple me-3">
                            <i class="fas fa-puzzle-piece"></i>
                        </div>
                        Activar Módulos
                        <i class="fas fa-chevron-right ms-auto text-muted small"></i>
                    </a>
                    <a href="index.php?module=Alixar&controller=Organization&action=index" class="list-group-item list-group-item-action border-0 px-0 py-2 d-flex align-items-center bg-transparent">
                        <div class="icon-circle-sm bg-light text-info me-3">
                            <i class="fas fa-building"></i>
                        </div>
                        Configuración Empresa
                        <i class="fas fa-chevron-right ms-auto text-muted small"></i>
                    </a>
                    <a href="index.php?module=Alixar&controller=AlixarDictionary&action=countries" class="list-group-item list-group-item-action border-0 px-0 py-2 d-flex align-items-center bg-transparent">
                        <div class="icon-circle-sm bg-light text-secondary me-3">
                            <i class="fas fa-book"></i>
                        </div>
                        Diccionarios
                        <i class="fas fa-chevron-right ms-auto text-muted small"></i>
                    </a>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="alixar-card p-4 h-100 bg-gradient-brand text-white border-0">
                <h5 class="fw-bold mb-4 opacity-75">Estado del Sistema</h5>
                <div class="d-flex align-items-center mb-4">
                    <div class="status-indicator active me-3"></div>
                    <div>
                        <p class="mb-0 fw-bold">Framework Alxarafe: v0.4.9</p>
                        <small class="opacity-75">Todas las herramientas disponibles.</small>
                    </div>
                </div>
                <div class="mt-auto pt-4 border-top border-white border-opacity-25">
                    <p class="small opacity-75 mb-1">Estado Conexión DB</p>
                    <p class="fw-bold mb-0">Latencia: {{ round(microtime(true) - $_SERVER["REQUEST_TIME_FLOAT"], 3) }}s</p>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
/* App-level dashboard card utility to avoid MD5 component errors */
.alixar-card {
    background: var(--card-bg, #ffffff);
    border-radius: 12px;
    border: 1px solid var(--border-color, rgba(0,0,0,0.1));
    box-shadow: 0 4px 12px rgba(0,0,0,0.05);
    height: 100%;
}

.bg-primary-soft { background-color: rgba(var(--bs-primary-rgb), 0.1) !important; }
.bg-success-soft { background-color: rgba(var(--bs-success-rgb), 0.1) !important; }
.bg-warning-soft { background-color: rgba(var(--bs-warning-rgb), 0.1) !important; }
.bg-danger-soft { background-color: rgba(var(--bs-danger-rgb), 0.1) !important; }

.stat-card:hover {
    transform: translateY(-5px);
}

.icon-circle-sm {
    width: 38px;
    height: 38px;
    border-radius: 8px;
    display: flex;
    align-items: center;
    justify-content: center;
}

.status-indicator {
    width: 10px;
    height: 10px;
    border-radius: 50%;
    background: #4cd964;
    box-shadow: 0 0 8px #4cd964;
}

.bg-gradient-brand {
    background: linear-gradient(135deg, #0061f2 0%, #6900f2 100%);
}

.transition-all {
    transition: all 0.2s ease-in-out;
}
</style>
@endsection
