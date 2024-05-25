@extends('themes.medical.layouts.app', [
    'title' => $post->seo_title ?? $post->title,
    'seoDescription' => $post->seo_description,
    'seoKeyWords' => $post->seo_text_keys,
    'sidebar' => false,
    ])

@section('content')

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{route('home')}}">Головна</a></li>
            <li class="breadcrumb-item active" aria-current="page"><a href="{{route('posts')}}">Дописи</a></li>
            <li class="breadcrumb-item active" aria-current="page">{{$post->title}}</li>
        </ol>
    </nav>

    <div class="cs-post cs-style1 cs-type1">
        <h1 class="cs-post__title mb0">{{$post->title}}</h1>

        @if(!empty($post->thumb()))
            <div class="blog-img-wrap post-page-img-main">
                <img src="{{$post->thumb()}}" alt="" />
            </div>
        @endif

        <div class="blog-wrap-info post-page-info-wrap">
            <span class="blog-item-info"><i class="fal fa-user"></i>By: {{$post->author()}}</span>
            <span class="blog-item-info"><i class="far fa-clock"></i> {{$post->date()}}</span>
            <span class="blog-item-info"><i class="fas fa-eye"></i>{{$post->views}}</span>
        </div>

        <div class="cs-post__info">
            <div class="cs-post__meta cs-style1">

                @if(!empty($post->category))
                    <a href="{{$post->category->link()}}" class="rt-post__comment">
                        <i class="fas fa-layer-group"></i> {{$post->category->title}}
                    </a>
                @endif
            </div>

            <div class="page-post-description">
                {!! $post->content !!}
            </div>
        </div>
    </div>

    <div class="cs-height__80 cs-height__lg__40"></div>

@endsection
