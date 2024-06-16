<?php

namespace App\Filament\Clinic\Resources\ClientResource\Pages;

use App\Filament\Clinic\Resources\ClientResource;
use Filament\Actions;
use Filament\Facades\Filament;
use Filament\Resources\Pages\CreateRecord;

class CreateClient extends CreateRecord
{
    protected static string $resource = ClientResource::class;

    protected function mutateFormDataBeforeCreate(array $data): array
    {
        $data['company_id'] = Filament::getTenant()->company_id;
        $data['clinic_id'] = Filament::getTenant()->id;

        return $data;
    }
}
