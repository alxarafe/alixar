<div class="{{ $colClass ?? 'col-12' }} mb-2">
    @if(!empty($label))
        <div class="dolibarr-panel-header py-1 px-2 border-bottom mb-2 bg-light">
            <span class="small text-muted text-uppercase fw-bold">{{ $label }}</span>
        </div>
    @endif
    <div class="row g-2 px-2">
        {!! $slot !!}
    </div>
</div>
