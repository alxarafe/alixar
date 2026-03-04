@extends('partial.layout.main')

@section('content')
<div class="container-fluid bg-white p-4 rounded shadow-sm">

    {{-- 1. Dolibarr-style Page Header --}}
    <div class="d-flex align-items-center mb-4 pb-2 border-bottom">
        <div class="me-3">
             <i class="fas fa-building fa-2x text-secondary"></i>
        </div>
        <div>
            <h1 class="h4 mb-0 fw-normal text-muted">
                @if($recordId === 'new')
                    Nuevo tercero (cliente potencial, cliente, proveedor)
                @else
                    Ficha tercero - {{ $record->nom ?? $record->name ?? 'Registro #'.$recordId }}
                @endif
            </h1>
        </div>
    </div>

    {{-- 2. Form Content (Replicating Dolibarr Table Look) --}}
    <x-form.form id="resource-form" method="POST" class="dolibarr-form">
        <x-form.input type="hidden" name="action" value="save" hide-label />
        <x-form.input type="hidden" name="id" :value="$recordId" hide-label />

        <div class="row g-0">
            {{-- Main Identity Data --}}
            <div class="col-12 mb-3 border-bottom pb-3">
                <div class="row align-items-center mb-2">
                    <div class="col-md-3 text-end pe-4 fw-bold" style="color: #6a1b9a;">Nombre del tercero</div>
                    <div class="col-md-9">
                        @if(isset($fields['nom']))
                            <x-dynamic-component :component="'form.' . $fields['nom']->getComponent()" :name="$fields['nom']->name" :label="false" :value="$fields['nom']->value" class="form-control-sm w-75" />
                        @endif
                    </div>
                </div>
                <div class="row align-items-center mb-2">
                    <div class="col-md-3 text-end pe-4">Apodo (comercial, marca registrada, ...)</div>
                    <div class="col-md-9">
                         @if(isset($fields['name_alias']))
                            @include('form.' . $fields['name_alias']->getComponent(), array_merge($fields['name_alias']->jsonSerialize(), ['label' => false, 'class' => 'form-control-sm w-75']))
                        @endif
                    </div>
                </div>
                <div class="row align-items-center mb-2">
                    <div class="col-md-3 text-end pe-4">Tipo</div>
                    <div class="col-md-9 d-flex gap-3">
                        <div class="form-check form-check-inline bg-light p-2 px-3 rounded border">
                            @if(isset($fields['client']))
                                <input class="form-check-input ms-0 me-2" type="checkbox" name="client" id="client" @if($record->client) checked @endif>
                                <label class="form-check-label small" for="client">Cliente potencial / Cliente</label>
                            @endif
                        </div>
                        <div class="form-check form-check-inline bg-light p-2 px-3 rounded border">
                            @if(isset($fields['fournisseur']))
                                <input class="form-check-input ms-0 me-2" type="checkbox" name="fournisseur" id="fournisseur" @if($record->fournisseur) checked @endif>
                                <label class="form-check-label small" for="fournisseur">Proveedor</label>
                            @endif
                        </div>
                    </div>
                </div>
            </div>

            {{-- Codes & Refs --}}
            <div class="col-12 mb-3 border-bottom pb-3">
                <div class="row align-items-center">
                    <div class="col-md-3 text-end pe-4">Código cliente <i class="fas fa-info-circle text-muted small ms-1"></i></div>
                    <div class="col-md-3">
                         @if(isset($fields['code_client']))
                            @include('form.' . $fields['code_client']->getComponent(), array_merge($fields['code_client']->jsonSerialize(), ['label' => false, 'class' => 'form-control-sm']))
                        @endif
                    </div>
                    <div class="col-md-3 text-end pe-4">Código proveedor</div>
                    <div class="col-md-3">
                         @if(isset($fields['code_fournisseur']))
                            @include('form.' . $fields['code_fournisseur']->getComponent(), array_merge($fields['code_fournisseur']->jsonSerialize(), ['label' => false, 'class' => 'form-control-sm']))
                        @endif
                    </div>
                </div>
            </div>

            {{-- Address Section --}}
            <div class="col-12 mb-3 border-bottom pb-3">
                <div class="row align-items-start mb-2">
                    <div class="col-md-3 text-end pe-4 pt-1">Dirección</div>
                    <div class="col-md-9">
                        @if(isset($fields['address']))
                            @include('form.' . $fields['address']->getComponent(), array_merge($fields['address']->jsonSerialize(), ['label' => false, 'class' => 'form-control-sm w-100']))
                        @endif
                    </div>
                </div>
                <div class="row align-items-center mb-2">
                    <div class="col-md-3 text-end pe-4">CP / Población</div>
                    <div class="col-md-2 pe-1">
                         @if(isset($fields['zip']))
                            @include('form.' . $fields['zip']->getComponent(), array_merge($fields['zip']->jsonSerialize(), ['label' => false, 'class' => 'form-control-sm']))
                        @endif
                    </div>
                    <div class="col-md-7">
                        @if(isset($fields['town']))
                            @include('form.' . $fields['town']->getComponent(), array_merge($fields['town']->jsonSerialize(), ['label' => false, 'class' => 'form-control-sm']))
                        @endif
                    </div>
                </div>
            </div>

            {{-- Contact Section --}}
            <div class="col-12 mb-3 border-bottom pb-3">
                <div class="row align-items-center mb-2">
                    <div class="col-md-3 text-end pe-4"><i class="fas fa-phone me-2 text-muted"></i>Teléfono</div>
                    <div class="col-md-3">
                         @if(isset($fields['phone']))
                            @include('form.' . $fields['phone']->getComponent(), array_merge($fields['phone']->jsonSerialize(), ['label' => false, 'class' => 'form-control-sm']))
                        @endif
                    </div>
                    <div class="col-md-3 text-end pe-4"><i class="fas fa-mobile-alt me-2 text-muted"></i>Móvil</div>
                    <div class="col-md-3">
                         @if(isset($fields['phone_mobile']))
                            @include('form.' . $fields['phone_mobile']->getComponent(), array_merge($fields['phone_mobile']->jsonSerialize(), ['label' => false, 'class' => 'form-control-sm']))
                        @endif
                    </div>
                </div>
                <div class="row align-items-center mb-2">
                    <div class="col-md-3 text-end pe-4"><i class="fas fa-globe me-2 text-muted"></i>Web</div>
                    <div class="col-md-9">
                         @if(isset($fields['url']))
                            @include('form.' . $fields['url']->getComponent(), array_merge($fields['url']->jsonSerialize(), ['label' => false, 'class' => 'form-control-sm w-50']))
                        @endif
                    </div>
                </div>
                <div class="row align-items-center">
                    <div class="col-md-3 text-end pe-4"><i class="fas fa-at me-2 text-muted"></i>Email</div>
                    <div class="col-md-9">
                         @if(isset($fields['email']))
                            @include('form.' . $fields['email']->getComponent(), array_merge($fields['email']->jsonSerialize(), ['label' => false, 'class' => 'form-control-sm w-50']))
                        @endif
                    </div>
                </div>
            </div>

            {{-- Prof IDs Section --}}
            <div class="col-12 mb-3 border-bottom pb-3">
                 <div class="row align-items-center mb-2">
                    <div class="col-md-3 text-end pe-4">ID profesional 1</div>
                    <div class="col-md-3">
                         @if(isset($fields['idprof1']))
                            @include('form.' . $fields['idprof1']->getComponent(), array_merge($fields['idprof1']->jsonSerialize(), ['label' => false, 'class' => 'form-control-sm']))
                        @endif
                    </div>
                    <div class="col-md-3 text-end pe-4">ID profesional 2</div>
                    <div class="col-md-3">
                         @if(isset($fields['idprof2']))
                            @include('form.' . $fields['idprof2']->getComponent(), array_merge($fields['idprof2']->jsonSerialize(), ['label' => false, 'class' => 'form-control-sm']))
                        @endif
                    </div>
                </div>
                <div class="row align-items-center">
                    <div class="col-md-3 text-end pe-4">ID profesional 3</div>
                    <div class="col-md-3">
                         @if(isset($fields['idprof3']))
                            @include('form.' . $fields['idprof3']->getComponent(), array_merge($fields['idprof3']->jsonSerialize(), ['label' => false, 'class' => 'form-control-sm']))
                        @endif
                    </div>
                    <div class="col-md-3 text-end pe-4">ID profesional 4</div>
                    <div class="col-md-3">
                         @if(isset($fields['idprof4']))
                            @include('form.' . $fields['idprof4']->getComponent(), array_merge($fields['idprof4']->jsonSerialize(), ['label' => false, 'class' => 'form-control-sm']))
                        @endif
                    </div>
                </div>
                <div class="row align-items-center mt-2">
                    <div class="col-md-3 text-end pe-4">CIF Intra.</div>
                    <div class="col-md-9">
                         @if(isset($fields['tva_intra']))
                            @include('form.' . $fields['tva_intra']->getComponent(), array_merge($fields['tva_intra']->jsonSerialize(), ['label' => false, 'class' => 'form-control-sm w-25']))
                        @endif
                    </div>
                </div>
            </div>

            {{-- Notes Section --}}
            <div class="col-12 mb-4">
                <div class="row">
                    <div class="col-md-3 text-end pe-4 pt-1">Notas públicas</div>
                    <div class="col-md-9">
                         @if(isset($fields['note_public']))
                            @include('form.' . $fields['note_public']->getComponent(), array_merge($fields['note_public']->jsonSerialize(), ['label' => false, 'class' => 'form-control-sm w-100', 'rows' => 3]))
                        @endif
                    </div>
                </div>
            </div>
        </div>

        {{-- 3. Buttons Centered at Bottom --}}
        <div class="d-flex justify-content-center gap-2 mt-5 mb-4">
            <button type="submit" class="btn btn-sm px-4 fw-bold text-white shadow-sm" style="background-color: #6a1b9a; border-radius: 4px;">
                @if($recordId === 'new') CREAR TERCERO @else GUARDAR CAMBIOS @endif
            </button>
            <a href="?module=Alixar&controller=ThirdParty" class="btn btn-sm btn-outline-secondary px-4 fw-bold" style="border-radius: 4px;">
                ANULAR
            </a>
        </div>
    </form>
</div>

<style>
    .dolibarr-form {
        font-size: 0.9rem;
    }
    .dolibarr-form .row {
        margin-bottom: 0px !important;
    }
    .dolibarr-form input, .dolibarr-form textarea {
        border: 1px solid #ccc;
        border-radius: 3px;
        padding: 4px 8px;
    }
    .dolibarr-form input:focus, .dolibarr-form textarea:focus {
        border-color: #6a1b9a;
        box-shadow: 0 0 0 0.2rem rgba(106, 27, 154, 0.25);
    }
</style>
@endsection
