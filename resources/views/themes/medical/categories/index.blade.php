@extends('themes.medical.layouts.app', [
    'title' => 'Categories',
    'seoDescription' => 'Categories',
    'seoKeyWords' => 'Categories',
    'sidebar' => false,
    ])

@section('content')

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{route('home')}}">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">
                <a href="{{route('categories')}}">Categories</a>
            </li>
        </ol>
    </nav>

    <div class="popular-tags">
        @foreach($categories as $category)

            <a href="{{$category->link()}}" class="tag-link">{{$category->title}}</a>

        @endforeach
    </div>

@endsection
