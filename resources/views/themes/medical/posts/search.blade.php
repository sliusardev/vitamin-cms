@extends('themes.medical.layouts.app')

@section('content')

    <div class="container">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{route('home')}}">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">
                    <a href="{{route('post-search')}}">Search</a>
                </li>
            </ol>
        </nav>

        <div class="card">
            <div class="card-body">
                <form action="{{route('post-search')}}">
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="button-addon2" name="s" value="{{$phrase}}">
                        <button type="submit" class="btn btn-outline-secondary" id="button-addon2">Search</button>
                    </div>
                </form>

            </div>
        </div>

        <div class="cs-height__40 cs-height__lg__40"></div>

        @includeIf('themes.medical.partials.posts')
    </div>


@endsection
