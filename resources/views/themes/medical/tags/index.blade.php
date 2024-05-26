@extends('themes.medical.layouts.app', [
    'title' => 'Tags',
    'seoDescription' => 'Tags',
    'seoKeyWords' => 'Tags',
    'sidebar' => false,
    ])

@section('content')
    <div class="container">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{route('home')}}">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">
                    <a href="{{route('tags')}}">Tags</a>
                </li>
            </ol>
        </nav>

        <div class="popular-tags">
            @foreach($tags as $tag)
                <a href="{{route('tag', $tag->slug)}}" class="tag-link">{{$tag->title}}</a>
            @endforeach
        </div>
    </div>

@endsection
