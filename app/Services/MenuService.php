<?php

namespace App\Services;

use App\Models\Menu;

class MenuService
{
    public static function hashLinks(string $hash = '')
    {
        $menu = Menu::query()->where('hash', $hash)->active()->locale()->first();

        return $menu ? $menu->links : [];
    }

    public static function positionLinks(string $position = '')
    {
        $menu = Menu::query()
            ->where('position', $position)
            ->where('is_enabled', 1)
            ->active()
            ->locale()
            ->first();

        return $menu ? $menu->links : [];
    }

    public static function byHash(string $hash = '')
    {
        return Menu::query()
            ->where('hash', $hash)
            ->active()
            ->locale()
            ->with('menu_items')->first();
    }

    public static function byPosition(string $position)
    {
        return Menu::query()
            ->where('position', $position)
            ->active()
            ->locale()
            ->with('menu_items')
            ->first();
    }

    public static function allByPosition(string $position)
    {
        return Menu::query()
            ->where('position', $position)
            ->active()
            ->locale()
            ->with('menu_items')
            ->get();
    }
}
