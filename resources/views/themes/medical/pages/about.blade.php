@extends('themes.medical.layouts.app', [
    'title' => $page->seo_title ?? $page->title,
    'seoDescription' => $page->seo_description,
    'seoKeyWords' => $page->seo_text_keys,
    'sidebar' => false,
    ])

@section('content')

    <div class="about-page-title-wrap">
        <div class="container">
            <div class="row ai">
                <div class="col-lg-12">
                    <span class="about-page-title">About</span>
                    <ul class="breadcrumbs">
                        <li><a href="{{route('home')}}">Home</a></li>
                        <span class="breadcrumbs-slash"> / </span>
                        <li><span>About</span></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="about-wrap about-template-wrap">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="about-img-wrap">
                        <img src="{{asset('themes/medical/img/about-2.jpeg')}}" alt="" />
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="about-info-wrap">
                        <span class="about-sub-title"># About Treatment</span>
                        <div class="about-title">We Offer You Dental Treatment That Meets Top Quality Standards</div>
                        <div class="about-descriptions">
                            <p>Vivamus magna justo lacinia eget consectetur sed convallis at tellus. Nulla quis lorem ut libero malesuada feugiat. Curabitur aliquet quam id dui posuere blandit. Quisque velit nisi pretium ut lacinia in elementum id enim.</p>
                            <ul>
                                <li>Search for innovation in dentistry</li>
                                <li>Flights, visa assistance and airport transfers</li>
                                <li>24 x 7 Personal client relationship manager</li>
                                <li>Life time warranties on all treatments</li>
                                <li>Advanced dental setup & technology</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection
