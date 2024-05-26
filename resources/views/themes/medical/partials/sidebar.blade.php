
<div class="search-wrap">
    <form action="{{route('post-search')}}" class="search-post">
        <input type="search" placeholder="Search..." class="search-field" name="s">
        <button type="submit">
            <i class="fas fa-search"></i>
        </button>
    </form>
</div>
<div class="recent-posts-wrap">
    <span class="recent-posts-title">Recent posts</span>
    <div class="recent-posts">
        @foreach(getRecentPosts() as $item)
            <div class="recent-post">
                <div class="recent-post-img">
                    <img src="{{$item->thumb()}}" alt="" />
                </div>
                <div class="recent-post-content">
                    <span class="recent-post-date">{{$item->date()}}</span>
                    <a href="{{$item->link()}}" class="recent-post-title">{{$item->title}}</a>
                </div>
            </div>
        @endforeach
    </div>
</div>
<div class="popular-tags-wrap">
    <span class="popular-tags-title">Popular Tags</span>
    <div class="popular-tags">
        @foreach(tags() as $tag)
            <a href="{{route('tag', $tag->slug)}}" class="tag-link">{{$tag->title}}</a>
        @endforeach
    </div>
</div>
