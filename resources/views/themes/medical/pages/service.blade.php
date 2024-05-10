@extends('themes.medical.layouts.app', [
    'title' => $page->seo_title ?? $page->title,
    'seoDescription' => $page->seo_description,
    'seoKeyWords' => $page->seo_text_keys,
    'sidebar' => false,
    ])

@section('content')

    <div class="services-page-title-wrap">
        <div class="container">
            <div class="row ai">
                <div class="col-lg-12">
                    <span class="contact-page-title">{{$page->title}}</span>
                    <ul class="breadcrumbs">
                        <li><a href="{{route('home')}}">Home</a></li>
                        <span class="breadcrumbs-slash"> / </span>
                        <li><a href="/services">Services</a></li>
                        <span class="breadcrumbs-slash"> / </span>
                        <li><span>{{$page->title}}</span></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="page-single">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="page-single-img-wrap">
                        <img src="{{$page->thumb()}}" alt="" />
                    </div>
                    <div class="page-single-content-wrap">{!! $page->content !!}</div>
                </div>
                <div class="col-lg-4">
                    <div class="search-wrap">
                        <form novalidate="" class="search-post">
                            <input type="search" placeholder="Search..." class="search-field">
                            <button type="submit">
                                <i class="fas fa-search"></i>
                            </button>
                        </form>
                    </div>
                    <div class="recent-posts-wrap">
                        <span class="recent-posts-title">Recent posts</span>
                        <div class="recent-posts">
                            <div class="recent-post">
                                <div class="recent-post-img">
                                    <img src="{{asset('themes/medical/img/blog-1-1.jpg')}}" alt="" />
                                </div>
                                <div class="recent-post-content">
                                    <span class="recent-post-date">Nov 27, 2024</span>
                                    <a href="#" class="recent-post-title">New Technology Make for Dental Operation</a>
                                </div>
                            </div>
                            <div class="recent-post">
                                <div class="recent-post-img">
                                    <img src="{{asset('themes/medical/img/blog-2-2.jpg')}}" alt="" />
                                </div>
                                <div class="recent-post-content">
                                    <span class="recent-post-date">Nov 26, 2024</span>
                                    <a href="#" class="recent-post-title">Regular Dental care make Your Smile Brighter</a>
                                </div>
                            </div>
                            <div class="recent-post">
                                <div class="recent-post-img">
                                    <img src="{{asset('themes/medical/img/blog-3-3.jpg')}}" alt="" />
                                </div>
                                <div class="recent-post-content">
                                    <span class="recent-post-date">Nov 25, 2024</span>
                                    <a href="#" class="recent-post-title">Dental Hygiene for All Age to Make Smile</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="popular-tags-wrap">
                        <span class="popular-tags-title">Popular Tags</span>
                        <div class="popular-tags">
                            <a href="#" class="tag-link">Business</a>
                            <a href="#" class="tag-link">Privacy</a>
                            <a href="#" class="tag-link">Technology</a>
                            <a href="#" class="tag-link">Tips</a>
                            <a href="#" class="tag-link">Uncategorized</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection