<?php

namespace App\Services;

use App\Enums\RoleEnum;
use App\Models\Clinic;
use Spatie\Permission\Models\Role;

class CompanyService
{
    public static function getCompanyRoles(): array
    {
        return Role::query()
            ->whereIn('name', RoleEnum::companyRoles())
            ->pluck('name', 'id')
            ->toArray();
    }

    public static function getCompanyClinics(): array
    {
        return Clinic::query()
            ->where('company_id', session('company_id'))
            ->pluck('name', 'id')
            ->toArray();
    }
}