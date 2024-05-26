
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
        <a href="#" class="tag-link">Business</a>
        <a href="#" class="tag-link">Privacy</a>
        <a href="#" class="tag-link">Technology</a>
        <a href="#" class="tag-link">Tips</a>
        <a href="#" class="tag-link">Uncategorized</a>
    </div>
</div>
