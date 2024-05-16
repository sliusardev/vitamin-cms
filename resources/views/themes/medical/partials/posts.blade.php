
<div class="row">
    <div class="col-lg-12">
        <span class="blog-title">News And Blog </span>
    </div>
</div>
<div class="row">
    @if(!empty($posts))

        @foreach($posts as $post)

            <div class="col-lg-4">
                <div class="blog-item">
                    <a href="{{$post->link()}}" class="blog-item-wrap">
                        <div class="blog-img-wrap">
                            <img src="{{$post->thumb()}}" alt="" />
                        </div>
                        <div class="blog-wrap-info">
                            <span class="blog-item-info"><i class="fal fa-user"></i>By: {{$post->author()}}</span>
                            <span class="blog-item-info"><i class="far fa-clock"></i>
                                    {{$post->date()}}
                                </span>
                        </div>
                        <div class="blog-wrap-text">
                                <span class="blog-item-title">
                                    {{$post->title}}
                                </span>
                        </div>
                    </a>
                </div>
            </div>

        @endforeach

            @if(method_exists($posts, 'links'))

                <div class="cs-post__pagination cs-style1">
                    <ul class="page-numbers">
                        @foreach($posts->appends(Request::except('page'))->toArray()['links'] as $paginationItem)

                    <li>
                        <a class="page-numbers @if($paginationItem['active']) current @endif" href="{{$paginationItem['url']}}">
                            {!! $paginationItem['label'] !!}
                        </a>
                    </li>

                @endforeach
                    </ul>
                </div>
            @endif

         @endif

</div>

