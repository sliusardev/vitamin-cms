<?php

namespace App\Services;

use App\Models\Page;

class PageService
{
    public static function getListOfPageTemplates(): array
    {
        return AdmService::getViewBladeFileNames(SettingService::value('theme').'/pages');
    }

    public static function getPageTemplateName(string $templateName): string
    {
        $template = $templateName;

        $templates = self::getListOfPageTemplates();

        if(!in_array($templateName, $templates)) {
            $template = 'page';
        }

        if(!in_array('page', $templates)) {
            abort(404);
        }

        return $template;
    }

    public function getOneBySlug(string $slug): object|null
    {
        $page = Page::query()
            ->where('slug', $slug)
            ->with('children')
            ->active()
            ->locale()
            ->first();

        if($page) {
            $page->increment('views');
            $page->save();
        }

        return $page;
    }

    public function getOneByParentSlug(string $parentSlug, string $slug): object|null
    {
        $page = Page::query()
            ->whereHas('parent', function($q) use ($parentSlug){
                $q->where('slug', $parentSlug);
            })
            ->where('slug', $slug)
            ->active()
            ->locale()
            ->first();

        if($page) {
            $page->increment('views');
            $page->save();
        }

        return $page;
    }

    public function getByParentId($id)
    {
        return Page::query()
            ->where('parent_id', $id)
            ->orderBy('order')
            ->active()
            ->locale()
            ->get();
    }
}
