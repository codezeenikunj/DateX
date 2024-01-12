@extends('include.app')

@section('header')

    <script src="{{ asset('asset/script/report.js') }}"></script>

@endsection

@section('content')

    <div class="card">

        <div class="card-header">

            <h4>{{ __('report') }}</h4>

        </div>

        <div class="card-body">

            <div class="table-responsive">

                <table class="table table-striped" style="width: 100% !important;" id="UsersTable">

                    <thead>

                        <tr>

                            <th>{{ __('user_name') }} </th>

                            <th>Report By </th>

                            <th>{{ __('reason') }}</th>

                            <th>{{ __('blocked_users') }}</th>

                        </tr>

                    </thead>

                    <tbody>



                    </tbody>

                </table>

            </div>

        </div>

    </div>

@endsection

