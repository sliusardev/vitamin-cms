<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Company extends Model
{
    use HasFactory;

    protected $fillable = [
        'hash',
        'name',
        'slug',
        'email',
        'phone',
        'address',
        'logo',
        'is_enabled',
        'seo_title',
        'seo_text_keys',
        'seo_description',
        'website',
        'type',
    ];

    protected $casts = [
        'is_enabled' => 'boolean',
        'custom_fields' => 'array',
        'hash' => 'string',
    ];

    public function users(): HasMany
    {
        return $this->hasMany(User::class);
    }
}
