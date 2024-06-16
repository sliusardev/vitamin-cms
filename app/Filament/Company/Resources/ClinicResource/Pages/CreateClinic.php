<?php

namespace App\Filament\Company\Resources\ClinicResource\Pages;

use App\Filament\Company\Resources\ClinicResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Support\Str;

class CreateClinic extends CreateRecord
{
    protected static string $resource = ClinicResource::class;

    protected function mutateFormDataBeforeCreate(array $data): array
    {
        $data['company_id'] = auth()->user()->getCompanyId();
        $data['hash'] = Str::random(15);

        return $data;
    }
}
