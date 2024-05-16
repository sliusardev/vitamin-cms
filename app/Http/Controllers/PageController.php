<?php

namespace App\Http\Controllers;

use App\Services\PageService;
use App\Services\PostService;
use Illuminate\Http\Request;

class PageController extends Controller
{
    private PageService $pageService;
    private PostService $postService;

    public function __construct(PageService $pageService, PostService $postService)
    {
        $this->pageService = $pageService;
        $this->postService = $postService;
    }

    public function index(Request $request)
    {
        $posts = $this->postService->getAll(3);

        return themeView('index', compact('posts'));
    }

    public function show(Request $request, $slug)
    {
        $page = $this->pageService->getOneBySlug($slug);

        if(!$page) {
            return redirect('/');
        }

        $thumb = $page->thumb();
        $images = $page->images();
        $template = $page->template ?? 'page';
        $templateName = PageService::getPageTemplateName($template);

        return themeView(
            'pages.'.$templateName,
            compact('page', 'thumb', 'images')
        );
    }

    public function showByParent(Request $request,  string $parentSlug, string $slug)
    {
        $page = $this->pageService->getOneByParentSlug($parentSlug, $slug);

        if(!$page) {
            return redirect('/');
        }

        $thumb = $page->thumb();
        $images = $page->images();
        $template = $page->template ?? 'page';
        $templateName = PageService::getPageTemplateName($template);

        return themeView(
            'pages.'.$templateName,
            compact('page', 'thumb', 'images')
        );
    }

}
