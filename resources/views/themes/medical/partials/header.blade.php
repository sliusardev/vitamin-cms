<header class="desc">

    <div class="top-info-wrap">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="top-content-wrap">
                        <div class="top-content-item">
                            <i class="far fa-clock"></i> Mon–Fri 10:00 am–6:00 pm Sat–Sun 11:00 am– 4:00 pm
                        </div>
                        <div class="top-content-item">
                            <i class="fal fa-phone-volume"></i> +088 123 654 988 35
                        </div>
                        <div class="top-content-item">
                            <i class="far fa-map-marker"></i>  35 West Dental Street, California 1004
                        </div>
                        <div class="top-content-item">
                            <i class="far fa-envelope"></i> test@gmail.com
                        </div>
                        <div class="top-content-item">
                            <div class="social-top-wrap">
                                <a href="#"><i class="fab fa-telegram-plane"></i></a>
                                <a href="#"><i class="fab fa-instagram"></i></a>
                                <a href="#"><i class="fab fa-facebook-f"></i></a>
                                <a href="#"><i class="fab fa-linkedin-in"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="menu-main-wrap">
        <div class="container">
            <div class="wrap-main-menu-bg">
                <div class="row ai">
                    <div class="col-lg-3">
                        <a href="{{route('home')}}" class="main-logo">
                            <span>{{$settings['site_name']}}</span>
                        </a>
                    </div>
                    <div class="col-lg-6">
                        <div class="main-menu">
                            <ul>

                                @foreach(menuByPosition('top') as $menuItem)
                                    <li>
                                        <a href="{{$menuItem->link}}">
                                            {{$menuItem->title}}
                                            @if(!$menuItem->sub_item->isEmpty()) <i class="fal fa-chevron-down"></i> @endif
                                        </a>

                                        @if(!$menuItem->sub_item->isEmpty())
                                            <ul class="sub-menu">
                                                @foreach($menuItem->sub_item as $subItem)
                                                    <li>
                                                        <a href="{{$subItem->link}}">{{$subItem->title}}</a>
                                                    </li>
                                                @endforeach
                                            </ul>
                                        @endif

                                    </li>
                                @endforeach
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <a href="#" class="appointment-link"> Book An Appointment </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

</header>

<header class="mobile">

    <div class="container">
        <div class="row">
            <div class="col-8">
                <div class="main-logo">
                    <span>Medical cms</span>
                </div>
            </div>
            <div class="col-4">
                <div class="menu_container">
                    <a href="#" class="mobile_menu"><i class="fal fa-bars"></i></a>
                </div>
                <div class="mobile_menu_container">
                    <div class="mobile_menu_content">
                        <div class="main-logo">
                            <span>{{$settings['site_name']}}</span>
                        </div>
                        <div class="main-menu-mobile">
                            <ul>

                                @foreach(menuByPosition('top') as $menuItem)
                                    <li>
                                        <a href="{{$menuItem->link}}" @if(!$menuItem->sub_item->isEmpty()) class="toggle-submenu" @endif>
                                            {{$menuItem->title}}
                                            @if(!$menuItem->sub_item->isEmpty()) <i class="fal fa-chevron-down"></i> @endif
                                        </a>

                                        @if(!$menuItem->sub_item->isEmpty())
                                            <ul class="sub-menu">
                                                @foreach($menuItem->sub_item as $subItem)
                                                    <li>
                                                        <a href="{{$subItem->link}}">{{$subItem->title}}</a>
                                                    </li>
                                                @endforeach
                                            </ul>
                                        @endif

                                    </li>
                                @endforeach

                            </ul>
                        </div>
                        <div class="top-content-wrap mobile">
                            <div class="top-content-item">
                                <i class="far fa-clock"></i> Mon–Fri 10:00 am–6:00 pm Sat–Sun 11:00 am– 4:00 pm
                            </div>
                            <div class="top-content-item">
                                <i class="fal fa-phone-volume"></i> +088 123 654 988 35
                            </div>
                            <div class="top-content-item">
                                <i class="far fa-map-marker"></i>  35 West Dental Street, California 1004
                            </div>
                            <div class="top-content-item">
                                <i class="far fa-envelope"></i> test@gmail.com
                            </div>
                            <div class="top-content-item">
                                <div class="social-top-wrap">
                                    <a href="#"><i class="fab fa-telegram-plane"></i></a>
                                    <a href="#"><i class="fab fa-instagram"></i></a>
                                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="mobile_menu_overlay"></div>
            </div>
        </div>
    </div>

</header>