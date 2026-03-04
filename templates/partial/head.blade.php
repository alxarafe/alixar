<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="title" content="{!! $me->title ?? 'Alxarafe' !!}">
<meta name="author" content="Rafael San José">
<meta name="description" content="Alixar ERP - Basado en Alxarafe">
<title>{!! $me->title ?? 'Alixar' !!}</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

{{-- App-level base layout CSS (applied to ALL themes) --}}
<link href="/css/alixar-layout.css" rel="stylesheet">

{{-- Dynamic Theme CSS --}}
@php
    $activeTheme = $_COOKIE['alx_theme']
        ?? \Alxarafe\Base\Config::getConfig()->main->theme
        ?? 'default';
@endphp
<link href="/themes/{{ $activeTheme }}/css/default.css" rel="stylesheet">

{!! $me->getRenderHeader() !!}

<style>
    /* Responsive overrides */
    @media (max-width: 768px) {
        .alixar-sidebar { width: 0; padding: 0; overflow: hidden; }
        .top-menu-item span { display: none; }
        .top-menu-item { min-width: 45px; padding: 0 8px; }
        .alixar-brand span { display: none; }
    }

    /* Scrollable tabs on narrow screens */
    .nav-tabs {
        flex-wrap: nowrap;
        overflow-x: auto;
        -webkit-overflow-scrolling: touch;
        scrollbar-width: none;
    }
    .nav-tabs::-webkit-scrollbar { display: none; }
    .nav-tabs .nav-item { white-space: nowrap; flex-shrink: 0; }

    /* Switcher global styles */
    .animate__fadeInFast { animation-duration: 0.2s; }
    .nav-link.dropdown-toggle::after { display: none !important; }
</style>

@stack('css')

<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lipis/flag-icons@7.2.3/css/flag-icons.min.css" />
