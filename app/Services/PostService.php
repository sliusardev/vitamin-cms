<?php

namespace App\Services;

use App\Models\Post;
use App\Services\AdmService;
use Illuminate\Contracts\Pagination\LengthAwarePaginator;
use Illuminate\Database\Eloquent\Builder;

class PostService
{

    public function getAll(?int $paginationCount = 10): LengthAwarePaginator
    {
        return Post::query()
            ->active()
            ->locale()
            ->with(['category', 'tags', 'user'])
            ->orderBy('created_at', 'desc')
            ->paginate($paginationCount);
    }

    public function getOneBySlug($slug)
    {
        $post = Post::query()->where('slug', $slug)
            ->active()
            ->locale()
            ->with(['category', 'tags', 'user'])
            ->first();

        if($post) {
            $post->increment('views');
            $post->save();
        }

        return $post;
    }

    public function getAllByCategorySlug($slug, ?int $paginationCount = 10)
    {
        return Post::query()
            ->with(['category', 'tags', 'user'])
            ->active()
            ->locale()
            ->whereHas('category', function (Builder $query) use ($slug){
                $query->where('slug', $slug);
            })
            ->orderBy('created_at', 'desc')
            ->paginate($paginationCount);
    }

    public function getAllByTagSlug($slug, ?int $paginationCount = 10)
    {
        return Post::query()
            ->with(['category', 'tags', 'user'])
            ->active()
            ->locale()
            ->whereHas('tags', function (Builder $query) use ($slug){
                $query->where('slug', $slug);
            })
            ->orderBy('created_at', 'desc')
            ->paginate($paginationCount);
    }

    public static function popularPosts(?int $paginationCount = 5, ?string $categorySlug = '')
    {
        $post = Post::query()->active()->locale()->locale();

        if(!empty($categorySlug)) {
            $post = $post->whereHas('category', function (Builder $query) use ($categorySlug){
                $query->where('slug', $categorySlug);
            });
        }

        return $post->with(['category', 'tags', 'user'])->orderBy('views', 'desc')->paginate($paginationCount);
    }

    public function searchByPhrase(string $phrase, ?int $paginationCount = 10)
    {
        return Post::query()
            ->active()
            ->locale()
            ->where('title', 'like', '%'.$phrase.'%')
            ->orWhere('content', 'like', '%'.$phrase.'%')
            ->orWhere('short', 'like', '%'.$phrase.'%')
            ->with(['category', 'tags', 'user'])
            ->orderBy('created_at', 'desc')
            ->paginate($paginationCount);
    }

    public static function recentPosts(int $limit = 5)
    {
        return Post::query()
            ->active()
            ->locale()
            ->select('id', 'title', 'slug', 'thumb', 'short', 'created_at' )
            ->orderBy('created_at', 'desc')
            ->limit($limit)->get();
    }
}
