<?php

namespace App\Models;

use App\Traits\ContentTrait;
use App\Traits\HasCmsTranslationTrait;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Page extends Model
{
    use HasFactory;
    use ContentTrait;
    use HasCmsTranslationTrait;

    protected $fillable = [
        'user_id',
        'parent_id',
        'title',
        'slug',
        'short',
        'content',
        'template',
        'custom_fields',
        'thumb',
        'images',
        'locale',
        'is_enabled',
        'seo_title',
        'seo_text_keys',
        'seo_description',
        'views',
    ];

    protected $casts = [
        'is_enabled' => 'boolean',
        'custom_fields' => 'array',
        'images' => 'array',
    ];

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    public function link(): string
    {
        if(!empty($this->parent)) {
            return route('page-parent', [$this->parent->slug, $this->slug]);
        }

        return route('page', $this->slug);
    }

    public function parent(): BelongsTo
    {
        return $this->belongsTo(Page::class, 'parent_id');
    }

    public function children(): HasMany
    {
        return $this->hasMany(Page::class, 'parent_id');
    }
}
