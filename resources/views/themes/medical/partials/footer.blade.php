<footer>
    <div class="container">
        <div class="row">
            <div class="col-lg-4">
                <div class="main-logo">
                    <span>{{$settings['site_name']}}</span>
                </div>
                <a href="#" class="footer-link"><span class="footer-span"> Location: </span> 35 West Dental Street</a>
                <a href="#" class="footer-link"><span class="footer-span"> Phone: </span> +088 123 654 987</a>
                <a href="#" class="footer-link"><span class="footer-span"> Email: </span> test@gmail.com</a>
                <div class="footer-social-wrap">
                    <a href="#"><i class="fab fa-telegram-plane"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>
            <div class="col-lg-4">
                <span class="footer-title">Useful Links</span>
                <ul class="footer-list">
                    @foreach(menuPositionLinks('footer_useful_links') as $link)
                        <li>
                            <a href="{{$link['url']}}" @if($link['blank']) target="_blank" @endif>
                                {{$link['text']}}
                            </a>
                        </li>
                    @endforeach
                </ul>
            </div>
            <div class="col-lg-4">
                <span class="footer-title">Our Services</span>
                <ul class="footer-list">
                    @foreach(menuPositionLinks('footer_our_services') as $link)
                        <li>
                            <a href="{{$link['url']}}" @if($link['blank']) target="_blank" @endif>
                                {{$link['text']}}
                            </a>
                        </li>
                    @endforeach
                </ul>
            </div>
        </div>
    </div>
</footer>