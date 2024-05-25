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
                    <span class="contact-page-title">Services</span>
                    <ul class="breadcrumbs">
                        <li><a href="{{route('home')}}">Home</a></li>
                        <span class="breadcrumbs-slash"> / </span>
                        <li><span>Services</span></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="contact-page-info-wrap">
        <div class="container">
            <div class="row">
                @foreach($page->children as $child)
                    <div class="col-lg-4">
                        <div class="contact-page-info-item">
                            <div class="popular-services-img-wrap">
                                <img src="{{$child->thumb()}}" alt="" />
                            </div>
                            <span class="services-page-info-item-title">{{$child->title}}</span>
                            <span class="services-page-info-item-description">{!! $child->short !!}</span>
                            <a href="{{$child->link()}}" class="load-more">Learn More</a>
                        </div>
                    </div>
                @endforeach
{{--                <div class="col-lg-4">--}}
{{--                    <div class="contact-page-info-item">--}}
{{--                        <div class="services-page-icon">--}}
{{--                            <i class="fal fa-eye"></i>--}}
{{--                        </div>--}}
{{--                        <span class="services-page-info-item-title">Glaucoma</span>--}}
{{--                        <span class="services-page-info-item-description">Vivamus magna justo lacinia eget consectetur sed convallis at tellus. Nulla quis lorem ut libero malesuada feugiat.</span>--}}
{{--                        <a href="#" class="load-more">Learn More</a>--}}
{{--                    </div>--}}
{{--                </div>--}}
{{--                <div class="col-lg-4">--}}
{{--                    <div class="contact-page-info-item">--}}
{{--                        <div class="services-page-icon">--}}
{{--                            <i class="fal fa-eye"></i>--}}
{{--                        </div>--}}
{{--                        <span class="services-page-info-item-title">Amblyopia</span>--}}
{{--                        <span class="services-page-info-item-description">Vivamus magna justo lacinia eget consectetur sed convallis at tellus. Nulla quis lorem ut libero malesuada feugiat.</span>--}}
{{--                        <a href="#" class="load-more">Learn More</a>--}}
{{--                    </div>--}}
{{--                </div>--}}
{{--                <div class="col-lg-4">--}}
{{--                    <div class="contact-page-info-item">--}}
{{--                        <div class="services-page-icon">--}}
{{--                            <i class="fal fa-eye"></i>--}}
{{--                        </div>--}}
{{--                        <span class="services-page-info-item-title">Strabismus</span>--}}
{{--                        <span class="services-page-info-item-description">Vivamus magna justo lacinia eget consectetur sed convallis at tellus. Nulla quis lorem ut libero malesuada feugiat.</span>--}}
{{--                        <a href="#" class="load-more">Learn More</a>--}}
{{--                    </div>--}}
{{--                </div>--}}
{{--                <div class="col-lg-4">--}}
{{--                    <div class="contact-page-info-item">--}}
{{--                        <div class="services-page-icon">--}}
{{--                            <i class="fal fa-eye"></i>--}}
{{--                        </div>--}}
{{--                        <span class="services-page-info-item-title">Astigmatism </span>--}}
{{--                        <span class="services-page-info-item-description">Vivamus magna justo lacinia eget consectetur sed convallis at tellus. Nulla quis lorem ut libero malesuada feugiat. </span>--}}
{{--                        <a href="#" class="load-more">Learn More</a>--}}
{{--                    </div>--}}
{{--                </div>--}}
{{--                <div class="col-lg-4">--}}
{{--                    <div class="contact-page-info-item">--}}
{{--                        <div class="services-page-icon">--}}
{{--                            <i class="fal fa-eye"></i>--}}
{{--                        </div>--}}
{{--                        <span class="services-page-info-item-title">Glaucoma </span>--}}
{{--                        <span class="services-page-info-item-description">Vivamus magna justo lacinia eget consectetur sed convallis at tellus. Nulla quis lorem ut libero malesuada feugiat. </span>--}}
{{--                        <a href="#" class="load-more">Learn More</a>--}}
{{--                    </div>--}}
{{--                </div>--}}
{{--                <div class="col-lg-4">--}}
{{--                    <div class="contact-page-info-item">--}}
{{--                        <div class="services-page-icon">--}}
{{--                            <i class="fal fa-eye"></i>--}}
{{--                        </div>--}}
{{--                        <span class="services-page-info-item-title">Amblyopia</span>--}}
{{--                        <span class="services-page-info-item-description">Vivamus magna justo lacinia eget consectetur sed convallis at tellus. Nulla quis lorem ut libero malesuada feugiat.</span>--}}
{{--                        <a href="#" class="load-more">Learn More</a>--}}
{{--                    </div>--}}
{{--                </div>--}}
{{--                <div class="col-lg-4">--}}
{{--                    <div class="contact-page-info-item">--}}
{{--                        <div class="services-page-icon">--}}
{{--                            <i class="fal fa-eye"></i>--}}
{{--                        </div>--}}
{{--                        <span class="services-page-info-item-title">Strabismus</span>--}}
{{--                        <span class="services-page-info-item-description">Vivamus magna justo lacinia eget consectetur sed convallis at tellus. Nulla quis lorem ut libero malesuada feugiat.</span>--}}
{{--                        <a href="#" class="load-more">Learn More</a>--}}
{{--                    </div>--}}
{{--                </div>--}}
{{--                <div class="col-lg-4">--}}
{{--                    <div class="contact-page-info-item">--}}
{{--                        <div class="services-page-icon">--}}
{{--                            <i class="fal fa-eye"></i>--}}
{{--                        </div>--}}
{{--                        <span class="services-page-info-item-title">Amblyopia</span>--}}
{{--                        <span class="services-page-info-item-description">Vivamus magna justo lacinia eget consectetur sed convallis at tellus. Nulla quis lorem ut libero malesuada feugiat.</span>--}}
{{--                        <a href="#" class="load-more">Learn More</a>--}}
{{--                    </div>--}}
{{--                </div>--}}
{{--                <div class="col-lg-4">--}}
{{--                    <div class="contact-page-info-item">--}}
{{--                        <div class="services-page-icon">--}}
{{--                            <i class="fal fa-eye"></i>--}}
{{--                        </div>--}}
{{--                        <span class="services-page-info-item-title">Strabismus</span>--}}
{{--                        <span class="services-page-info-item-description">Vivamus magna justo lacinia eget consectetur sed convallis at tellus. Nulla quis lorem ut libero malesuada feugiat.</span>--}}
{{--                        <a href="#" class="load-more">Learn More</a>--}}
{{--                    </div>--}}
{{--                </div>--}}
            </div>
        </div>
    </div>

@endsection
