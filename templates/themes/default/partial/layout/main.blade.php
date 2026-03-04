<!DOCTYPE html>
<html lang="{!! $me->config->main->language ?? 'en' !!}">
<head>
    <title>{!! $me->title !!}</title>
    @include('partial.head')
</head>
<body>
    @if ($empty ?? false)
        @include('partial.body_empty')
    @else
        @include('partial.body_standard')
    @endif
    @include('partial.footer')
</body>
</html>
