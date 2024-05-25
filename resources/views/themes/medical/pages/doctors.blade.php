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
                    <span class="contact-page-title">Doctors</span>
                    <ul class="breadcrumbs">
                        <li><a href="{{route('home')}}">Home</a></li>
                        <span class="breadcrumbs-slash"> / </span>
                        <li><span>Doctors</span></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="doctors-page-info-wrap">
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <div class="doctor-wrap">
                        <img src="{{asset('themes/medical/img/doctor-1.jpg')}}" alt="" />
                        <span class="doctor-name">Dr. Johnson Melbourne </span>
                        <span class="doctor-positions">Prosthodontics Dentist </span>
                        <div class="doctor-socials">
                            <a href="#"><i class="fab fa-facebook-f"></i></a>
                            <a href="#"><i class="fab fa-twitter"></i></a>
                            <a href="#"><i class="fab fa-linkedin-in"></i></a>
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="doctor-wrap">
                        <img src="{{asset('themes/medical/img/doctor-2.jpg')}}" alt="" />
                        <span class="doctor-name">Dr. Ena Dicrosa</span>
                        <span class="doctor-positions">Aesthetic Dentistry</span>
                        <div class="doctor-socials">
                            <a href="#"><i class="fab fa-facebook-f"></i></a>
                            <a href="#"><i class="fab fa-twitter"></i></a>
                            <a href="#"><i class="fab fa-linkedin-in"></i></a>
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="doctor-wrap">
                        <img src="{{asset('themes/medical/img/doctor-3.jpg')}}" alt="" />
                        <span class="doctor-name">Dr. Addison Smith</span>
                        <span class="doctor-positions">Gastroenterologists</span>
                        <div class="doctor-socials">
                            <a href="#"><i class="fab fa-facebook-f"></i></a>
                            <a href="#"><i class="fab fa-twitter"></i></a>
                            <a href="#"><i class="fab fa-linkedin-in"></i></a>
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="doctor-wrap">
                        <img src="{{asset('themes/medical/img/doctor-6.jpg')}}" alt="" />
                        <span class="doctor-name">Dr. Edie Dee </span>
                        <span class="doctor-positions">Cardiologists</span>
                        <div class="doctor-socials">
                            <a href="#"><i class="fab fa-facebook-f"></i></a>
                            <a href="#"><i class="fab fa-twitter"></i></a>
                            <a href="#"><i class="fab fa-linkedin-in"></i></a>
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="doctor-wrap">
                        <img src="{{asset('themes/medical/img/doctor-7.jpg')}}" alt="" />
                        <span class="doctor-name">Dr. Sarah Taylor</span>
                        <span class="doctor-positions">Prosthodontics Dentist</span>
                        <div class="doctor-socials">
                            <a href="#"><i class="fab fa-facebook-f"></i></a>
                            <a href="#"><i class="fab fa-twitter"></i></a>
                            <a href="#"><i class="fab fa-linkedin-in"></i></a>
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="doctor-wrap">
                        <img src="{{asset('themes/medical/img/doctor-8.jpg')}}" alt="" />
                        <span class="doctor-name">Dr. Aiken Ward</span>
                        <span class="doctor-positions">Aesthetic Dentistry</span>
                        <div class="doctor-socials">
                            <a href="#"><i class="fab fa-facebook-f"></i></a>
                            <a href="#"><i class="fab fa-twitter"></i></a>
                            <a href="#"><i class="fab fa-linkedin-in"></i></a>
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection
