<!DOCTYPE html>
<html lang="en">


<head>
    <meta charset="UTF-8">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
    <title>{{ __('app_name') }}</title>

    {{-- Jquery --}}
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>




    @yield('header')

    <link rel="stylesheet" href="{{ asset('asset/css/app.min.css') }}?v={{time()}}">

    <link href="{{ asset('asset/css/style.css') }}?v={{time()}}" rel="stylesheet">
    <link rel="stylesheet" href="{{ asset('asset/css/components.css') }}">
    <link rel="stylesheet" href="{{ asset('asset/css/custom.css') }}">

    <link rel='shortcut icon' type='image/x-icon' href='{{ asset('asset/img/favicon.ico') }}'
        style="width: 2px !important;" />

    <link rel="stylesheet" href="{{ asset('asset/bundles/codemirror/lib/codemirror.css') }}">
    <link rel="stylesheet" href=" {{ asset('asset/bundles/codemirror/theme/duotone-dark.css') }} ">
    <link rel="stylesheet" href=" {{ asset('asset/bundles/jquery-selectric/selectric.css') }}">



    <script src="{{ asset('asset/cdnjs/iziToast.min.js') }}"></script>
    <link rel="stylesheet" href="{{ asset('asset/cdncss/iziToast.css') }}" />

    <script src="{{ asset('asset/cdnjs/sweetalert.min.js') }}"></script>
    <script src="{{ asset('asset/script/env.js') }}?v={{time()}}"></script>
    <link rel="stylesheet" href="{{ asset('asset/style/app.css') }}?v={{time()}}">



</head>

<body>
    <div class="loader"></div>

    <div id="app">
        <div class="main-wrapper main-wrapper-1">
            <div class="navbar-bg"></div>
            <nav class="navbar navbar-expand-lg main-navbar sticky">
                <div class="form-inline mr-auto">
                    <ul class="navbar-nav mr-3">
                        <li><a href="#" data-toggle="sidebar" class="nav-link nav-link-lg
									collapse-btn">
                                <i data-feather="align-justify"></i></a></li>
                    </ul>
                </div>
                <ul class="navbar-nav navbar-right">
                    <div class="form-group">
                        <form action="{{route('change_language')}}" method="post" id="language_change">
                        @csrf     
                            <select name="chang_lang" class="form-control" onchange="document.getElementById('language_change').submit()">
                                @foreach(\App\Models\Language::get(); as $key=>$value)
                                <option value="{{$value->id}}" {{$value->is_default==1?'selected':''}}>{{$value->language_name}}</option>
                                @endforeach
                            </select>
                        </form>
                    </div>
                    <li class="dropdown"><a href="#" data-toggle="dropdown"
                            class="nav-link dropdown-toggle nav-link-lg nav-link-user"> <span
                                class="d-sm-none d-lg-inline-block btn btn-light"> {{ __('logout') }} </span></a>
                        <div class="dropdown-menu dropdown-menu-right pullDown">

                            <a href="{{ route('logout') }}" class="dropdown-item has-icon text-danger"> <i
                                    class="fas fa-sign-out-alt"></i>
                                {{ __('logout') }}
                            </a>
                        </div>
                    </li>
                </ul>
            </nav>
            <div class="main-sidebar sidebar-style-2">
                <aside id="sidebar-wrapper">
                    <div class="sidebar-brand">
                        <a href="{{ route('index') }}"><span class="logo-name"> {{ __('app_name') }}
                            </span>
                        </a>
                    </div>
                    <ul class="sidebar-menu">
                        <li class="menu-header">{{ __('main') }}</li>
                        <li class="sideBarli  indexSideA  ">
                            <a href="{{ route('index') }}" class="nav-link"><i
                                    class="fas fa-tachometer-alt pt-1"></i><span> {{ __('dashboard') }}
                                </span></a>
                        </li>

                        <li class="sideBarli  usersSideA">
                            <a href="{{ route('users') }}" class="nav-link"><i
                                    class="fas fa-users"></i><span>{{ __('users') }}</span></a>
                        </li>

                      {{--   <li class="sideBarli  liveapplicationSideA">
                            <a href="{{ route('liveapplication') }}" class="nav-link"><i
                                    class="fas fa-rss"></i><span>{{ __('live_applications') }}</span></a>
                        </li>

                        <li class="sideBarli  livehistorySideA">
                            <a href="{{ route('livehistory') }}" class="nav-link"><i
                                    class="fas fa-rss"></i><span>{{ __('live_history') }}</span></a>
                        </li>


                        <li class="sideBarli  redeemrequestsSideA">
                            <a href="{{ route('redeemrequests') }}" class="nav-link"><i
                                    class="fas fa-university"></i><span>{{ __('redeem_requests') }}</span></a>
                        </li> --}}


                        {{-- <li class="sideBarli  packageSideA">
                            <a href="{{ route('package') }}" class="nav-link"><i
                                    class="fas fa-box"></i><span>{{ __('subscription') }}</span></a>
                        </li> --}}

                        <li class="sideBarli  diamondpackSideA">
                            <a href="{{ route('diamondpacks') }}" class="nav-link"><i
                                    class="fas fa-box"></i><span>{{ __('plans') }}</span></a>
                        </li>

                        <li class="sideBarli subscriptionSideA">
                            <a href="{{ route('subscription') }}" class="nav-link"><i
                                    class="fas fa-gift"></i><span>{{ __('subscription') }}</span></a>
                        </li>

                       {{--  <li class="sideBarli  verificationRequestSideA">
                            <a href="{{ route('verificationrequests') }}" class="nav-link"><i
                                    class="fas fa-check-circle"></i><span>{{ __('verification_requests') }}</span></a>
                        </li> --}}

                      <li class="sideBarli  reportSideA">
                            <a href="{{ route('report') }}" class="nav-link"><i
                                    class="fas fa-question"></i><span>{{ __('report') }}</span></a>
                        </li>

                        <li class="sideBarli notificationSideA">
                            <a href="{{ route('notifications') }}" class="nav-link"><i
                                    class="fas fa-bell"></i><span>{{ __('notifications') }}</span></a>
                        </li>

                        <li class="sideBarli interestsSideA">
                            <a href="{{ route('interest') }}" class="nav-link"><i
                                    class="fas fa-heart"></i><span>{{ __('interests') }}</span></a>
                        </li>

                        <li class="sideBarli relationship_typeSideA">
                            <a href="{{ route('relationship_type') }}" class="nav-link"><i
                                    class="fas fa-heart"></i><span>{{ __('relationship_type') }}</span></a>
                        </li>

                        <li class="sideBarli sexual_orientationSideA">
                            <a href="{{ route('sexual_orientation') }}" class="nav-link"><i
                                    class="fas fa-heart"></i><span>{{ __('sexual_orientations') }}</span></a>
                        </li>

                        <li class="sideBarli lookingSideA">
                            <a href="{{ route('looking') }}" class="nav-link"><i
                                    class="fas fa-heart"></i><span>{{ __('looking') }}</span></a>
                        </li>
                        <li class="sideBarli personal_questionSideA">
                            <a href="{{ route('personal_question') }}" class="nav-link"><i
                                    class="fas fa-heart"></i><span>{{ __('personal_question') }}</span></a>
                        </li>
                        <li class="sideBarli know_languagesSideA">
                            <a href="{{ route('know_languages') }}" class="nav-link"><i
                                    class="fas fa-heart"></i><span>{{ __('know_languages') }}</span></a>
                       </li>

                       {{-- <li class="sideBarli otherSideA">
                            <a href="{{ route('setting') }}"><i
                                    class="fas fa-cog  pt-1"></i><span>{{ __('setting') }}</span></a>
                        </li> --}}

                        <li class="menu-header">{{ __('Pages') }}</li>

                        <li class="sideBarli  privacySideA">
                            <a href="{{ route('viewPrivacy') }}" class="nav-link"><i
                                    class="fas fa-info"></i><span>{{ __('privacy_policy') }}</span></a>
                        </li>

                        <li class="sideBarli  termsSideA">
                            <a href="{{ route('viewTerms') }}" class="nav-link"><i
                                    class="fas fa-info"></i><span>{{ __('terms_of_use') }}</span></a>
                        </li>


                    </ul>
                </aside>
            </div>


            <!-- Main Content -->
            <div class="main-content">

                @yield('content')
                <form action="">
                    <input type="hidden" id="user_type" value="{{ session('user_type') }}">
                </form>

            </div>

        </div>
    </div>



    <script src="{{ asset('asset/js/app.min.js ') }}"></script>


    <script src="{{ asset('asset/bundles/datatables/datatables.min.js ') }}"></script>
    <script src=" {{ asset('asset/bundles/datatables/DataTables-1.10.16/js/dataTables.bootstrap4.min.js') }}"></script>
    <script src="{{ asset('asset/bundles/jquery-ui/jquery-ui.min.js ') }}"></script>

    <script src=" {{ asset('asset/js/page/datatables.js') }}"></script>

    <script src="{{ asset('asset/js/scripts.js') }}"></script>
    <script src="{{ asset('asset/script/app.js') }}"></script>

    <!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    @yield('script')

</body>


</html>
