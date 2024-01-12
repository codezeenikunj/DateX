@extends('include.app')
@section('header')
    <script src="{{ asset('asset/script/gifts.js') }}"></script>
@endsection
@section('content')



    <div class="card">
        <div class="card-header">
            <h4>{{ __('subscription') }}</h4>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-striped" id="table-22">
                    <thead>
                        <tr>
                            <th>{{ __('user_name') }}</th>
                            <th>{{ __('plan') }}</th>
                            <th>{{ __('price') }}</th>
                            <th>{{ __('duration') }}</th>
                            <th>{{ __('start_on') }}</th>
                            <th>{{ __('expires_on') }}</th>
                            <th>{{ __('cancelled_on') }}</th>
                            <th>{{ __('status') }}</th>
                        </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
@endsection
