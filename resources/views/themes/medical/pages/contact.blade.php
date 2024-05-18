@extends('themes.medical.layouts.app', [
    'title' => $page->seo_title ?? $page->title,
    'seoDescription' => $page->seo_description,
    'seoKeyWords' => $page->seo_text_keys,
    'sidebar' => false,
    ])

@section('content')

    <div class="contact-page-title-wrap">
        <div class="container">
            <div class="row ai">
                <div class="col-lg-6">
                    <span class="contact-page-title">Contact Us</span>
                    <ul class="breadcrumbs">
                        <li><a href="#">Home</a></li>
                        <span class="breadcrumbs-slash"> / </span>
                        <li><span>Contact Us</span></li>
                    </ul>
                </div>
                <div class="col-lg-6">
                    <div class="contact-page-img">
                        <img src="img/page-banner.png" alt="" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="contact-page-info-wrap">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="contact-page-info-item">
                        <div class="contact-page-icon">
                            <i class="far fa-map-marker-alt"></i>
                        </div>
                        <span class="contact-page-info-item-title">Our Location:</span>
                        <span class="contact-page-info-item-description">35 West Dental Street Nyz California 1004</span>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="contact-page-info-item">
                        <div class="contact-page-icon">
                            <i class="far fa-paper-plane"></i>
                        </div>
                        <span class="contact-page-info-item-title">Email Address:</span>
                        <span class="contact-page-info-item-description">hello@inba.com support@inba.com</span>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="contact-page-info-item">
                        <div class="contact-page-icon">
                            <i class="far fa-phone-alt"></i>
                        </div>
                        <span class="contact-page-info-item-title">Phone Number:</span>
                        <span class="contact-page-info-item-description"> +01 321 654 214 </br>  (+62)81 4891 1562 </span>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="contact-page-info-item">
                        <div class="contact-page-icon">
                            <i class="far fa-calendar-alt"></i>
                        </div>
                        <span class="contact-page-info-item-title">Open Hour:</span>
                        <span class="contact-page-info-item-description">09:00 AM to 18:00 PM Sunday to Thursday</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="get-in-touch">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <span class="get-in-touch">Get In Touch</span>
                    <div class="form-wrap">
                        <form action="{{formActionSlug('contact-us-form')}}" method="post">
                            @csrf
                            <div class="form-items">
                                <div class="form-item">
                                    <label>Your Name</label>
                                    <input type="text" name="name" id="name" required="" data-error="Please enter your name" placeholder="Name" class="form-control">
                                </div>
                                <div class="form-item">
                                    <label>Your Email</label>
                                    <input type="email" name="email" id="email" required="" data-error="Please enter your email" placeholder="Your email" class="form-control">
                                </div>
                            </div>
                            <div class="form-items">
                                <div class="form-item">
                                    <label>Your Phone</label>
                                    <input type="text" name="phone" id="phone_number" required="" data-error="Please enter your number" placeholder="Your phone" class="form-control">
                                </div>
                                <div class="form-item">
                                    <label>Subject</label>
                                    <input type="text" name="subject" id="msg_subject" required="" data-error="Please enter your subject" placeholder="Subject" class="form-control">
                                </div>
                            </div>
                            <div class="form-items">
                                <div class="form-item-all">
                                    <label>Message</label>
                                    <textarea name="message" id="message" cols="30" rows="5" required="" data-error="Write your message" placeholder="Your message" class="form-control"></textarea>
                                </div>
                            </div>
                            <div class="form-items">
                                <div class="form-item-all">
                                    <button type="submit" class="default-btn"> Send Message </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection
