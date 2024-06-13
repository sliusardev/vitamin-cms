<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Clinic extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'company_id',
        'hash',
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

    public function users(): BelongsToMany
    {
        return $this->belongsToMany(User::class);
    }
}
