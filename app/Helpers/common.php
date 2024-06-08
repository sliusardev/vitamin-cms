<?php

use App\Models\MenuItem;
use App\Services\AdmFormService;
use App\Services\CategoryService;
use App\Services\ChunkService;
use App\Services\GalleryService;
use App\Services\PostService;
use App\Services\SettingService;
use App\Services\ThemeService;
use App\Services\MenuService;
use App\Services\TagService;

function themeView(string $bladeName, array $params = [])
{
    return ThemeService::themeView($bladeName, $params);
}

function themeSettings(): array
{
    return ThemeService::themeSettings(SettingService::value('theme'));
}

function menuHashLinks(string $hash) {
    return MenuService::hashLinks($hash);
}

function menuPositionLinks(string $position) {
    return MenuService::positionLinks($position);
}

function menuByHash($slug) {
    $menu = MenuService::byHash($slug);
    return !empty($menu->menu_items) ? MenuItem::tree($menu->id) : $menu->menu_items ?? [];
}

function menuByPosition($position) {
    $menu = MenuService::byPosition($position);
    return !empty($menu->menu_items) ? MenuItem::tree($menu->id) : $menu->menu_items ?? [];
}

function galleryHash(string $hash) {
    return GalleryService::getByHash($hash);
}
function galleryHashItems(string $hash) {
    return GalleryService::getByHashItems($hash);
}

function categories() {
    return CategoryService::getAllParents();
}

function tags() {
    return TagService::getAll();
}

function formActionSlug(string $slug): string
{
    return AdmFormService::actionBySlug($slug);
}

function formActionHash(string $hash): string
{
    return route('adm-form', $hash);
}

function getRecentPosts()
{
    return PostService::recentPosts();
}

function companyTest() {
    dd(session('company_id'));
}
