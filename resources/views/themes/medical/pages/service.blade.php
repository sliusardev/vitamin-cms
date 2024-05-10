@extends('themes.medical.layouts.app', [
    'title' => $page->seo_title ?? $page->title,
    'seoDescription' => $page->seo_description,
    'seoKeyWords' => $page->seo_text_keys,
    'sidebar' => false,
    ])

@section('content')

    <div class="services-page-title-wrap">
        <div class="container">
            <div class="row ai">
                <div class="col-lg-12">
                    <span class="contact-page-title">{{$page->title}}</span>
                    <ul class="breadcrumbs">
                        <li><a href="{{route('home')}}">Home</a></li>
                        <span class="breadcrumbs-slash"> / </span>
                        <li><a href="/services">Services</a></li>
                        <span class="breadcrumbs-slash"> / </span>
                        <li><span>{{$page->title}}</span></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="page-single">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="page-single-img-wrap">
                        <img src="{{$page->thumb()}}" alt="" />
                    </div>
                    <div class="page-single-content-wrap">{!! $page->content !!}</div>
                </div>
                @include('themes.medical.partials.sidebar')
            </div>
        </div>
    </div>

@endsection
