<!DOCTYPE html>
<html lang="{!! $me->config->main->language ?? 'es' !!}">
<head>
    @include('partial.head')
</head>
<body class="alxarafe-theme">
    @php
        $_body = 'body_' . ($empty ?? false ? 'empty' : 'standard');
    @endphp
    @include('partial.' . $_body)
    @include('partial.footer')
</body>
</html>
