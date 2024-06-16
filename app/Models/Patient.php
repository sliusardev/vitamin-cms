<?php

namespace App\Models;

use App\Enums\Clinic\AnimalType;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\SoftDeletes;

class Patient extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $fillable = [
        'company_id',
        'clinic_id',
        'client_id',
        'name',
        'animal_type',
        'breed_id',
        'gender',
        'birth_date',
        'microchip_number',
        'notes',
        'photo',
        'hash',
    ];

    protected $casts = [
        'animal_type' => AnimalType::class,
    ];

    // Відношення до власника
    public function client(): BelongsTo
    {
        return $this->belongsTo(Client::class);
    }

    public function clinic(): BelongsTo
    {
        return $this->belongsTo(Clinic::class);
    }

    public function company(): BelongsTo
    {
        return $this->belongsTo(Company::class);
    }
}
