<?php

namespace App\Enums\Clinic;

use Illuminate\Support\Arr;

enum AnimalType: string
{
    case Dog = 'dog';
    case Cat = 'cat';
    case Bird = 'bird';
    case Fish = 'fish';
    case Reptile = 'reptile';
    case Rodent = 'rodent';
    case Other = 'other';

    /**
     * Get the display name for the enum value.
     *
     * @return string
     */
    public function label(): string
    {
        return match($this) {
            self::Dog => 'Dog',
            self::Cat => 'Cat',
            self::Bird => 'Bird',
            self::Fish => 'Fish',
            self::Reptile => 'Reptile',
            self::Rodent => 'Rodent',
            self::Other => 'Other',
        };
    }

    /**
     * Get all enum values.
     *
     * @return array
     */
    public static function values(): array
    {
        return Arr::pluck(self::cases(), 'value');
    }
}
