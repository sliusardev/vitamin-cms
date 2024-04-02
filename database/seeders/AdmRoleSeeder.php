<?php

namespace Database\Seeders;

use App\Enums\RoleEnum;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;

class AdmRoleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $values = RoleEnum::allValues();

        foreach ($values as $value){
            Role::create([
                'name' => $value,
                'guard_name' => 'web',
            ]);
        }
    }
}
