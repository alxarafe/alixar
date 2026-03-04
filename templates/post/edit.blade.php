@extends('partial.layout.main')

@section('content')
<div class="container-fluid mt-4">
    <div class="row justify-content-center">
        <div class="col-12">
            <x-component.card>
                <x-slot:header_slot class="bg-white d-flex justify-content-between align-items-center py-3">
                    <h5 class="mb-0 fw-bold">
                        <i class="fas fa-edit me-2 text-primary"></i> 
                        {{ $recordId === 'new' ? 'Nuevo Alixar' : 'Editar Alixar' }}
                    </h5>
                    <div>
                        <x-component.button href="{{ $me::url() }}" type="outline-secondary" spacing="btn-sm" tag="link">
                            <i class="fas fa-arrow-left me-1"></i> Volver
                        </x-component.button>
                    </div>
                </x-slot:header_slot>

                <div class="p-4">
                    <x-form.form method="POST" action="{{ $me::url('save') }}" id="post-edit-form">
                        <x-form.input type="hidden" name="action" value="save" hide-label />
                        <x-form.input type="hidden" name="id" :value="$recordId" hide-label />

                        <div class="row">
                            <!-- Left Column: Content -->
                            <div class="col-lg-8">
                                <div class="mb-3">
                                    <x-form.input :name="$fields['title']->name" :label="$fields['title']->label" :value="$fields['title']->value" />
                                </div>
                                <div class="mb-3">
                                    <x-form.textarea :name="$fields['content']->name" :label="$fields['content']->label" :value="$fields['content']->value" rows="20" />
                                </div>
                            </div>

                            <!-- Right Column: Settings & SEO -->
                            <div class="col-lg-4">
                                <x-component.card class="bg-light border-0 mb-4 shadow-none">
                                    <div class="p-4">
                                        <h6 class="fw-bold mb-3">Publicación</h6>
                                        <div class="mb-3">
                                            <x-form.input :name="$fields['slug']->name" :label="$fields['slug']->label" :value="$fields['slug']->value" />
                                        </div>
                                        <div class="mb-3">
                                            <x-form.boolean :name="$fields['is_published']->name" :label="$fields['is_published']->label" :value="$fields['is_published']->value" />
                                        </div>
                                        <div class="mb-3">
                                            <x-form.datetime :name="$fields['published_at']->name" :label="$fields['published_at']->label" :value="$fields['published_at']->value" />
                                        </div>
                                    </div>
                                </x-component.card>

                                <x-component.card class="bg-light border-0 mb-4 shadow-none">
                                    <div class="p-4">
                                        <h6 class="fw-bold mb-3">Imagen Destacada</h6>
                                        <div id="image-preview-container" class="mb-3 {{ empty($data['featured_image']) ? 'd-none' : '' }}">
                                            <img id="featured-image-preview" src="{{ $data['featured_image'] ?? '' }}" class="img-fluid rounded border shadow-sm" style="max-height: 200px; width: 100%; object-fit: cover;">
                                        </div>
                                        <div class="input-group mb-2">
                                            <x-form.input name="data[featured_image]" id="featured_image_input" :value="$data['featured_image'] ?? ''" placeholder="URL de la imagen..." hide-label class="flex-grow-1" />
                                            <x-component.button type="primary" onclick="document.getElementById('image_upload_input').click()">
                                                <i class="fas fa-upload"></i>
                                            </x-component.button>
                                        </div>
                                        <input type="file" id="image_upload_input" class="d-none" accept="image/*" onchange="uploadFeaturedImage(this)">
                                        <div id="markdown-copy-container" class="mt-2 d-none">
                                            <label class="small text-muted mb-1">Copia esto al contenido:</label>
                                            <div class="input-group input-group-sm">
                                                <x-form.input id="markdown-code" value="" hide-label readonly class="font-monospace flex-grow-1" name="markdown" />
                                                <x-component.button type="outline-primary" onclick="copyMarkdownCode()">
                                                    <i class="fas fa-copy"></i>
                                                </x-component.button>
                                            </div>
                                        </div>
                                        <small class="text-muted d-block mt-2">Puedes pegar una URL o subir un archivo.</small>
                                    </div>
                                </x-component.card>

                                <x-component.card class="bg-light border-0 shadow-none">
                                    <div class="p-4">
                                        <h6 class="fw-bold mb-3">SEO (Opcional)</h6>
                                        <div class="mb-3">
                                            <x-form.input :name="$fields['meta_title']->name" :label="$fields['meta_title']->label" :value="$fields['meta_title']->value" />
                                        </div>
                                        <div class="mb-3">
                                            <x-form.textarea :name="$fields['meta_description']->name" :label="$fields['meta_description']->label" :value="$fields['meta_description']->value" rows="3" />
                                        </div>
                                        <div class="mb-3">
                                            <x-form.input :name="$fields['meta_keywords']->name" :label="$fields['meta_keywords']->label" :value="$fields['meta_keywords']->value" />
                                        </div>
                                    </div>
                                </x-component.card>
                            </div>
                        </div>

                        <div class="border-top mt-4 pt-4 text-end">
                            <x-component.button type="primary" spacing="btn-lg px-5 shadow-sm" class="save-button">
                                <i class="fas fa-save me-2"></i> Guardar Alixar
                            </x-component.button>
                        </div>
                    </x-form.form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
function uploadFeaturedImage(input) {
    if (!input.files || !input.files[0]) return;

    const formData = new FormData();
    formData.append('file', input.files[0]);

    // Show loading state
    const btn = input.previousElementSibling.lastElementChild;
    const originalIcon = btn.innerHTML;
    btn.innerHTML = '<i class="fas fa-spinner fa-spin"></i>';
    btn.disabled = true;

    fetch('index.php?module=Alixar&controller=Post&ajax=upload_image', {
        method: 'POST',
        body: formData
    })
    .then(response => response.json())
    .then(data => {
        if (data.status === 'success') {
            document.getElementById('featured_image_input').value = data.url;
            document.getElementById('featured-image-preview').src = data.url;
            document.getElementById('image-preview-container').classList.remove('d-none');
            
            // Generate Markdown code for easy copy-paste
            document.getElementById('markdown-code').value = '![' + document.getElementById('fields[title]').value + '](' + data.url + ')';
            document.getElementById('markdown-copy-container').classList.remove('d-none');

            // Trigger Change for autosave frameworks if any
            const event = new Event('change');
            document.getElementById('featured_image_input').dispatchEvent(event);
        } else {
            alert('Error al subir imagen: ' + (data.message || 'Desconocido'));
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('Error en la conexión al subir imagen.');
    })
    .finally(() => {
        btn.innerHTML = originalIcon;
        btn.disabled = false;
        input.value = ''; // Reset input
    });
}

function copyMarkdownCode() {
    const input = document.getElementById('markdown-code');
    input.select();
    input.setSelectionRange(0, 99999);
    navigator.clipboard.writeText(input.value);
    
    // Simple visual feedback
    const btn = event.currentTarget;
    const originalIcon = btn.innerHTML;
    btn.innerHTML = '<i class="fas fa-check"></i>';
    setTimeout(() => { btn.innerHTML = originalIcon; }, 2000);
}

// Sync preview on manual URL change
document.getElementById('featured_image_input').addEventListener('input', function() {
    const preview = document.getElementById('featured-image-preview');
    const container = document.getElementById('image-preview-container');
    if (this.value) {
        preview.src = this.value;
        container.classList.remove('d-none');
    } else {
        container.classList.add('d-none');
    }
});
</script>

<style>
    .card { border-radius: 12px; }
    .card-header { border-top-left-radius: 12px !important; border-top-right-radius: 12px !important; }
    .bg-light { background-color: #f8f9fa !important; }
    .form-label { font-weight: 600; color: #444; margin-bottom: 0.4rem; }
    .form-control:focus { box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.1); border-color: #86b7fe; }
</style>
@endsection
