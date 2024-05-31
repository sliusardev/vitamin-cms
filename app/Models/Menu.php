<?php

namespace App\Models;

use App\Traits\HasCmsTranslationTrait;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Support\Carbon;

class Menu extends Model
{
    use HasFactory;
    use HasCmsTranslationTrait;

    protected $fillable = [
        'title',
        'hash',
        'links',
        'position',
        'is_enabled',
        'locale',
    ];

    protected $casts = [
        'is_enabled' => 'boolean',
        'links' => 'array',
    ];

    public function scopeActive(Builder $query): void
    {
        $query->where('is_enabled', true)
            ->where('created_at', '<=',Carbon::now());
    }

    public function menu_items(): HasMany
    {
        return $this->hasMany(MenuItem::class)->orderBy('order');
    }
}
