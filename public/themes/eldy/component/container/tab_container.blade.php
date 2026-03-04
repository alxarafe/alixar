<div class="dolibarr-tabs-container">
    <ul class="nav nav-tabs border-bottom-0 mb-0" id="{{ $id ?? 'resourceTabs' }}" role="tablist">
        {!! $nav !!}
    </ul>
    <div class="tab-content border p-3 bg-white" id="{{ $id ?? 'resourceTabs' }}Content">
        {!! $content !!}
    </div>
</div>
