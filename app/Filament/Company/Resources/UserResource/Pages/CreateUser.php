<?php

namespace App\Filament\Company\Resources\UserResource\Pages;

use App\Filament\Company\Resources\UserResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateUser extends CreateRecord
{
    protected static string $resource = UserResource::class;

    protected function mutateFormDataBeforeCreate(array $data): array
    {
        $data['company_id'] = auth()->user()->getCompanyId();

        return $data;
    }
}
