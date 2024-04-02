<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use App\Models\Post;
use App\Models\User;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        app()->call(AdmRoleSeeder::class);
        app()->call(AdmUserSeeder::class);
//
//        User::factory(10)->create();
//
//        Post::factory(1000)->create();
    }
}
