@extends('include.app')
@section('header')
    <script src="{{ asset('asset/script/users.js') }}"></script>
@endsection

@section('content')
    <div class="card">
        <div class="card-header">
            <h4>{{ __('users') }}</h4>
            <a href="{{ route('addFakeUser') }}" id="add-fake-user" class="ml-auto btn btn-primary">{{__('add_user')}}</a>
        </div>

        <div class="card-body">

            <div class="tab  " role="tabpanel">
              

                <div class="tab-content tabs" id="home">
                    {{-- Section 1 --}}
                    <div role="tabpanel" class="tab-pane active" id="Section1">
                        <div class="table-responsive">
                            <table class="table table-striped w-100" id="UsersTable">
                                <thead>
                                    <tr>
                                        <th>{{ __('user_image') }}</th>
                                        <th>{{ __('identity') }}</th>
                                        <th>{{ __('full_name') }}</th>
                                        <th>{{ __('mobile_no') }}</th>
                                        <th>{{ __('age') }}</th>
                                        <th>{{ __('gender') }}</th>
                                        <th>{{ __('block_user') }}</th>
                                        <th>{{ __('view_details') }}</th>
                                    </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                    </div>
                    
                </div>

            </div>


        </div>
    </div>
@endsection
