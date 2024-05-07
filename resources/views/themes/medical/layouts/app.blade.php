<!DOCTYPE HTML>

<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta name="description" content="{{$seoDescription ?? $settings['seo_description'] ?? ''}}">
    <meta name="keywords" content="{{$seoKeyWords ?? $settings['seo_text_keys'] ?? ''}}">
    <title>{{$settings['site_name'] ?? ''}} - {{$title ?? $settings['seo_title'] ?? ''}}</title>
    <link rel="stylesheet" href="{{asset('themes/medical/css/bootstrap.min.css')}}">
    <link rel="stylesheet" href="{{asset('themes/medical/css/stylesheet.css')}}">
    <link rel="stylesheet" href="{{asset('themes/medical/css/fontawesome.min.css')}}">
    <link rel="stylesheet" href="{{asset('themes/medical/css/owl.carousel.min.css')}}">
    <link rel="stylesheet" href="{{asset('themes/medical/css/owl.theme.default.min.css')}}">
    <link rel="stylesheet" href="{{asset('themes/medical/css/style.css')}}">

    {!! $settings['header_codes'] ?? ''!!}
    
    <style>
        {!! $settings['global_css'] ?? ''!!}
    </style>
</head>

@include('themes.medical.partials.header')

<body>



    @yield('content')

    @include('themes.medical.partials.footer')

    <script src="{{asset('themes/medical/js/jQuery.js')}}"></script>
    <script src="{{asset('themes/medical/js/bootstrap.min.js')}}"></script>
    <script src="{{asset('themes/medical/js/owl.carousel.min.js')}}"></script>
    <script src="{{asset('themes/medical/js/main.js')}}"></script>

</body>


</html>
