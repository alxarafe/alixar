<div class="alixar-edit-card card shadow-sm border-0 rounded-4 overflow-hidden mb-5">
    <!-- Tabs Header -->
    <div class="card-header bg-white border-bottom-0 pt-3 px-4">
        <ul class="nav nav-tabs border-bottom-0 gap-2" id="resourceEditTabs" role="tablist">
            @foreach($config['edit']['sections'] as $key => $section)
                <li class="nav-item" role="presentation">
                    <button class="nav-link border-0 rounded-pills px-4 py-2 fw-semibold {{ $loop->first ? 'active' : '' }}" 
                            id="tab-{{ $key }}-btn"
                            data-bs-toggle="tab" 
                            data-bs-target="#tab-{{ $key }}" 
                            type="button" role="tab"
                            aria-selected="{{ $loop->first ? 'true' : 'false' }}">
                        {{ $section['title'] }}
                    </button>
                </li>
            @endforeach
        </ul>
    </div>

    <!-- Form Container -->
    <form id="resource-edit-form" method="POST" class="needs-validation" novalidate>
        <div class="card-body p-4 bg-light bg-opacity-10">
            <div id="form-alerts"></div>
            <input type="hidden" name="id" value="{{ $me->recordId }}">

            <div class="tab-content" id="resourceEditTabContent">
                @foreach($config['edit']['sections'] as $key => $section)
                    <div class="tab-pane fade {{ $loop->first ? 'show active' : '' }}" 
                         id="tab-{{ $key }}" role="tabpanel">
                        
                        <div class="row g-4">
                            @foreach($section['fields'] as $field)
                                @php 
                                    $colClass = is_array($field) ? ($field['options']['col'] ?? 'col-md-12') : ($field->getOptions()['col'] ?? 'col-md-12');
                                    $fieldName = is_array($field) ? ($field['field'] ?? '') : $field->getField();
                                    $fieldType = is_array($field) ? ($field['type'] ?? 'text') : $field->getType();
                                    $label = is_array($field) ? ($field['label'] ?? '') : $field->getLabel();
                                @endphp
                                
                                <div class="{{ $colClass }}">
                                    @if($fieldType === 'panel')
                                        <div class="card border-0 shadow-sm rounded-3 mt-3">
                                            <div class="card-header bg-primary bg-opacity-10 py-2 border-0">
                                                <h6 class="mb-0 fw-bold text-primary small">{{ $label }}</h6>
                                            </div>
                                            <div class="card-body">
                                                <div class="row g-3">
                                                    @foreach($field->getFields() as $subField)
                                                        @php 
                                                            $subCol = is_array($subField) ? ($subField['options']['col'] ?? 'col-md-12') : ($subField->getOptions()['col'] ?? 'col-md-12');
                                                            $subName = is_array($subField) ? $subField['field'] : $subField->getField();
                                                            $subType = is_array($subField) ? ($subField['type'] ?? 'text') : $subField->getType();
                                                            $subLabel = is_array($subField) ? $subField['label'] : $subField->getLabel();
                                                        @endphp
                                                        <div class="{{ $subCol }}">
                                                            <label class="form-label small fw-bold text-secondary mb-1">{{ $subLabel }}</label>
                                                            <input type="{{ in_array($subType, ['date', 'datetime', 'number']) ? $subType : 'text' }}" 
                                                                   class="form-control" 
                                                                   name="data[{{ $subName }}]" 
                                                                   id="field_{{ $subName }}">
                                                        </div>
                                                    @endforeach
                                                </div>
                                            </div>
                                        </div>
                                    @elseif($fieldType === 'relation_list')
                                        <!-- Componente Sub-Líneas MasterDetail -->
                                        <div class="alixar-relation-list mt-3">
                                            <h6 class="fw-bold mb-3 border-bottom pb-2">{{ $label }}</h6>
                                            <div class="table-responsive">
                                                <table class="table table-sm table-striped">
                                                    <thead>
                                                        <tr>
                                                            @foreach($field->getOptions()['columns'] as $col)
                                                                <th class="small">{{ $col['label'] ?? $col['field'] }}</th>
                                                            @endforeach
                                                        </tr>
                                                    </thead>
                                                    <tbody id="lines_{{ $fieldName }}">
                                                        <!-- Populate via JS -->
                                                    </tbody>
                                                </table>
                                            </div>
                                            <button type="button" class="btn btn-sm btn-outline-primary mt-2">
                                                <i class="fas fa-plus me-1"></i> Añadir Línea
                                            </button>
                                        </div>
                                    @else
                                        <label class="form-label small fw-bold text-secondary mb-1 text-uppercase">{{ $label }}</label>
                                        <input type="{{ in_array($fieldType, ['date', 'datetime', 'number']) ? $fieldType : 'text' }}" 
                                               class="form-control" 
                                               name="data[{{ $fieldName }}]" 
                                               id="field_{{ $fieldName }}">
                                    @endif
                                </div>
                            @endforeach
                        </div>
                    </div>
                @endforeach
            </div>
        </div>

        <!-- Sticky Footer for Actions -->
        <div class="card-footer bg-white p-3 border-top-0 d-flex justify-content-end gap-3 px-4 shadow-sm-top">
            <a href="?module={{ $me->getModuleName() }}&controller={{ $me->getControllerName() }}" class="btn btn-light border px-4">
                <i class="fas fa-times me-2"></i> {{ $me->_('Cancel') }}
            </a>
            <button type="submit" class="btn btn-primary px-5 fw-bold shadow-sm">
                <i class="fas fa-save me-2"></i> {{ $me->_('Save') }}
            </button>
        </div>
    </form>
</div>

<style>
.nav-tabs .nav-link { color: #64748b; background: #f1f5f9 !important; transition: all 0.3s; margin-top: 5px; opacity: 0.8; }
.nav-tabs .nav-link.active { color: white; background: var(--alixar-primary) !important; box-shadow: 0 4px 10px rgba(30, 60, 114, 0.4); opacity: 1; transform: translateY(-3px); }
.rounded-pills { border-radius: 50px; }
.form-control:focus { box-shadow: 0 0 0 3px rgba(30, 60, 114, 0.1); border-color: var(--alixar-primary); }
</style>

<script>
document.addEventListener('DOMContentLoaded', function() {
    const recordId = "{{ $me->recordId }}";
    
    // Auto-populado de datos AJAX
    if (recordId !== 'new') {
        const url = new URL(window.location.href);
        url.searchParams.set('ajax', 'get_record');
        
        fetch(url.toString())
            .then(res => res.json())
            .then(data => {
                if(data.data) {
                    const record = data.data;
                    for (const [key, value] of Object.entries(record)) {
                        const input = document.getElementById('field_' + key);
                        if (input) input.value = value || '';
                    }
                    
                    // Populate Relations (Simple placeholder logic for MVP)
                    if(data.relations) {
                        for(const [rel, items] of Object.entries(data.relations)) {
                             const tbody = document.getElementById('lines_' + rel);
                             if(tbody && items) {
                                 items.forEach(item => {
                                     // (Renderizado dinámico de líneas...)
                                 });
                             }
                        }
                    }
                }
            });
    }

    // Lógica de Guardado
    document.getElementById('resource-edit-form').addEventListener('submit', function(e) {
        e.preventDefault();
        const btn = e.submitter;
        btn.disabled = true;
        btn.innerHTML = '<span class="spinner-border spinner-border-sm me-2"></span> Guardando...';

        const formData = new FormData(this);
        const object = { data: {} };
        formData.forEach((value, key) => {
            if (key.startsWith('data[')) {
                const fieldName = key.substring(5, key.length - 1);
                object.data[fieldName] = value;
            } else {
                object[key] = value;
            }
        });

        const url = new URL(window.location.href);
        url.searchParams.set('ajax', 'save_record');

        fetch(url.toString(), {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(object)
        })
        .then(res => res.json())
        .then(data => {
            if(data.status === 'success') {
                window.location.href = '?module={{ $me->getModuleName() }}&controller={{ $me->getControllerName() }}&id=' + (data.id || recordId);
            } else {
                alert('Error: ' + (data.error || 'Unknown error'));
                btn.disabled = false;
                btn.innerHTML = '<i class="fas fa-save me-2"></i> {{ $me->_('Save') }}';
            }
        })
        .catch(err => {
            console.error(err);
            btn.disabled = false;
        });
    });
});
</script>
