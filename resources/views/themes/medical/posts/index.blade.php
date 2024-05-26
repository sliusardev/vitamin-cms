@extends('themes.medical.layouts.app', [
    'sidebar' => false,
    ])

@section('content')
<div class="container">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{route('home')}}">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">
                <a href="{{route('posts')}}">Posts</a>
            </li>
        </ol>
    </nav>

    @includeIf('themes.medical.partials.posts')
</div>

@endsection
