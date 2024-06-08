<?php

namespace App\Services;

use App\Enums\RoleEnum;
use Spatie\Permission\Models\Role;

class UserService
{
    public static function getCompanyRoles(): array
    {
        return Role::query()->whereIn('name', RoleEnum::companyRoles())->pluck('name', 'id')->toArray();
    }

    public static function getCurrentUser()
    {
        return auth()->user() ?? [];
    }
}