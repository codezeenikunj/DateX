@extends('include.app')
@section('header')
    <script src="{{ asset('asset/script/setting.js') }}"></script>
@endsection

@section('content')
    <?php
    
    $admob = json_decode($admob, true);
    ?>

    <div class="card  ">
        <div class="card-header">
            <h4>{{ __('app_data') }}</h4>
            <div class="border-bottom-0 border-dark border"></div>
        </div>
        <div class="card-body">

            <form Autocomplete="off" class="form-group form-border appdataForm" action="" method="post">

                @csrf

                <input type="hidden" name="admob_id" value="1">


                @csrf
                <div class="form-row ">
                    <div class="form-group col-md-4">
                        <label for="">{{ __('currency') }}</label>
                        <input type="text" class="form-control" name="currency" value="{{ $appdata->currency }}"
                            required>
                    </div>

                    <div class="form-group col-md-4">
                        <label for="">{{ __('minimum_threshold') }}</label>
                        <input type="text" class="form-control" name="min_threshold"
                            value="{{ $appdata->min_threshold }}" required>
                    </div>

                    <div class="form-group col-md-4">
                        <label for="">{{ __('coin_rate') }}</label>
                        <input type="number" step="0.000001" class="form-control" name="coin_rate"
                            value="{{ $appdata->coin_rate }}" required>
                    </div>


                </div>

                <div class="form-row">

                    <div class="form-group col-md-4">
                        <label for="">{{ __('minimum_users_needed_to_keep_live_continue') }}</label>
                        <input type="text" class="form-control" name="min_user_live"
                            value="{{ $appdata->min_user_live }}" required>
                    </div>

                    <div class="form-group col-md-4">
                        <label for="">{{ __('maximum_minutes_users_can_live_stream_with_minimum_users') }}</label>
                        <input type="text" class="form-control" name="max_minute_live"
                            value="{{ $appdata->max_minute_live }}" required>
                    </div>
                     <div class="form-group col-md-4">
                        <label for="">{{ __('per_day_swipe_limit') }}</label>
                        <input type="number" class="form-control" name="per_day_swipe_limit"
                            value="{{ $appdata->per_day_swipe_limit }}" required>
                    </div>

                </div>


                <div class="form-row">

                    <div class="form-group col-md-3">
                        <label for="">{{ __('message_price') }}</label>
                        <input type="number" class="form-control" name="message_price"
                            value="{{ $appdata->message_price }}" pattern="[0-9]" required>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="">{{ __('reverse_swipe_price') }}</label>
                        <input type="number" class="form-control" name="reverse_swipe_price"
                            value="{{ $appdata->reverse_swipe_price }}" pattern="[0-9]" required>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="">{{ __('live_watching_price') }}</label>
                        <input type="number" class="form-control" name="live_watching_price"
                            value="{{ $appdata->live_watching_price }}" pattern="[0-9]" required>
                    </div>
                     <div class="form-group col-md-2">
                        <label for="">{{ __('referral_diamond') }}</label>
                        <input type="number" class="form-control" name="referral_diamond"
                            value="{{ $appdata->referral_diamond }}" required>
                    </div>
                     <div class="form-group col-md-2">
                        <label for="">{{ __('first_friend') }}</label>
                        <input type="number" class="form-control" name="first_friend"
                            value="{{ $appdata->first_friend }}" required>
                    </div>

                </div>

                <div class="my-4">
                    <h5 class="text-dark">{{ __('admob_ad_units') }}</h5>
                </div>
                <div class="form-row ">
                    <div class="form-group col-md-3">
                        <label for="">{{ __('admob_banner_ad_unit : Android') }}</label>
                        <input type="text" class="form-control" name="admob_banner"
                            value="{{ $appdata->admob_banner }}">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="">{{ __('admob_interstitial_ad_unit : Android') }}</label>
                        <input type="text" class="form-control" name="admob_int" value="{{ $appdata->admob_int }}">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="">{{ __('admob_banner_ad_unit : iOS') }}</label>
                        <input type="text" class="form-control" name="admob_banner_ios"
                            value="{{ $appdata->admob_banner_ios }}">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="">{{ __('admob_interstitial_ad_unit : iOS') }}</label>
                        <input type="text" class="form-control" name="admob_int_ios"
                            value="{{ $appdata->admob_int_ios }}">
                    </div>
                </div>
                 <div class="form-row ">
                    <div class="form-group col-md-3">
                        <label for="">{{ __('previus_swipe_diamond') }}</label>
                        <input type="text" class="form-control" name="previus_swipe_diamond"
                            value="{{ $appdata->previus_swipe_diamond }}">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="">{{ __('super_like_diamond') }}</label>
                        <input type="text" class="form-control" name="super_like_diamond" value="{{ $appdata->super_like_diamond }}">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="">{{ __('first_message_diamond') }}</label>
                        <input type="text" class="form-control" name="first_message_diamond"
                            value="{{ $appdata->first_message_diamond }}">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="">{{ __('video_call_diamond') }}</label>
                        <input type="text" class="form-control" name="video_call_diamond"
                            value="{{ $appdata->video_call_diamond }}">
                    </div>
                </div>
                <div class="form-row ">
                 
                </div>



                <div class="form-group-submit">
                    <button class="btn btn-primary " type="submit">{{ __('submit') }}</button>
                </div>

            </form>

        </div>
    </div>
@endsection
