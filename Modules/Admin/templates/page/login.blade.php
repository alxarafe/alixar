@extends('partial.layout.main')

@section('content')
<div class="container d-flex align-items-center justify-content-center" style="min-height: 80vh;">
    <div class="card shadow-lg border-0 alixar-login-card" style="width: 100%; max-width: 450px; border-radius: 20px; background: rgba(255,255,255,0.9); backdrop-filter: blur(10px);">
        <div class="card-body p-5 text-center">
            <div class="mb-5">
                <div class="mb-4 d-inline-block p-4 rounded-circle bg-primary bg-opacity-10 text-primary">
                    <i class="fas fa-shield-alt fa-3x"></i>
                </div>
                <h2 class="fw-bold">{{ \Alxarafe\Lib\Trans::_('administration_access') }}</h2>
                <p class="text-muted">{{ \Alxarafe\Lib\Trans::_('please_enter_credentials') }}</p>
            </div>

            <form method="POST" action="">
                <input type="hidden" name="action" value="login">
                
                <div class="text-start mb-4">
                    <label class="form-label fw-bold small text-uppercase text-muted">{{ \Alxarafe\Lib\Trans::_('login_name') }}</label>
                    <div class="input-group">
                        <span class="input-group-text bg-light border-0"><i class="fas fa-user text-muted"></i></span>
                        <input name="username" class="form-control form-control-lg bg-light border-0" placeholder="admin" required autofocus>
                    </div>
                </div>
                
                <div class="text-start mb-5">
                    <label class="form-label fw-bold small text-uppercase text-muted">{{ \Alxarafe\Lib\Trans::_('login_password') }}</label>
                    <div class="input-group">
                        <span class="input-group-text bg-light border-0"><i class="fas fa-lock text-muted"></i></span>
                        <input type="password" name="password" class="form-control form-control-lg bg-light border-0" placeholder="••••••••" required>
                    </div>
                </div>

                <div class="d-grid">
                    <button type="submit" class="btn btn-primary btn-lg rounded-pill py-3 fw-bold shadow-sm transition-all">
                        <i class="fas fa-sign-in-alt me-2"></i>{{ \Alxarafe\Lib\Trans::_('login_button') }}
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<style>
    body { 
        background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%); 
        min-height: 100vh; 
    }
    .alixar-login-card {
        transition: transform 0.3s ease;
    }
    .alixar-login-card:hover {
        transform: translateY(-5px);
    }
    /* Ensure compatibility with dark themes */
    [data-bs-theme="dark"] .alixar-login-card,
    .cyber-shell .alixar-login-card {
        background: rgba(15, 25, 35, 0.9) !important;
        border: 1px solid #00f0ff !important;
        color: #fff;
    }
    [data-bs-theme="dark"] .bg-light,
    .cyber-shell .bg-light {
        background-color: rgba(255,255,255,0.05) !important;
    }
    [data-bs-theme="dark"] .input-group-text,
    .cyber-shell .input-group-text {
        color: #00f0ff !important;
    }
</style>
@endsection
