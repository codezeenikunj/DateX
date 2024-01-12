@extends('include.app')

@section('header')

    <script src="{{ asset('asset/script/index.js') }}"></script>

@endsection



@section('content')

    <style>

        .chartjs-render-monitor {

            -webkit-animation: chartjs-render-animation 0.001s;

            animation: chartjs-render-animation 0.001s;

        }



        *,

        ::after,

        ::before {

            -webkit-box-sizing: border-box;

            box-sizing: border-box;

        }



        .mainbg {

            background-image: linear-gradient(14deg, #F10F75 0%, #FF298B 99.72%) !important;

        }



        .card-icon2 {

            width: 50px;

            height: 50px;

            line-height: 50px;

            font-size: 22px;

            margin: 5px 0px;

            box-shadow: 5px 5px 15px 0px rgba(244, 21, 122, 0.30);

            border-radius: 10px;

            background: #ff5622;

            text-align: center;

        }



        i {

            font-size: 20px !important;

        }



        .maincolor {

            color: white !important;

        }

    </style>

    <div class="col-12">
        <h4>{{ __('numbers_of_users') }}</h4>
        <div class="row">
            <div class="col-xl-3 col-lg-3 col-md-3 col-sm-12 col-xs-12">

                <div class="card">

                    <div class="card-statistic-4">

                        <div class="align-items-center justify-content-between">

                            <div class="row ">

                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pr-0 ">

                                    <div class="card-icon2 mainbg">

                                        <i class="fas fa-user maincolor"></i>

                                    </div>

                                    <div class="card-content">

                                        <h5 class="font-15 mt-3">{{ __('all_users') }}</h5>

                                        <h3 class="mb-3 total_user" >{{ $total_user }}</h3>



                                    </div>

                                </div>



                            </div>

                        </div>

                    </div>

                </div>
            </div>

            <div class="col-xl-3 col-lg-3 col-md-3 col-sm-12 col-xs-12">

                <div class="card">

                    <div class="card-statistic-4">

                        <div class="align-items-center justify-content-between">

                            <div class="row ">

                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pr-0 ">

                                    <div class="card-icon2 mainbg">

                                        <i class="fas fa-user maincolor"></i>

                                    </div>

                                    <div class="card-content">

                                        <h5 class="font-15 mt-3">{{ __('new_user_today') }}</h5>

                                        <h3 class="mb-3 ">{{ $today_user }}</h3>



                                    </div>

                                </div>



                            </div>

                        </div>

                    </div>

                </div>

            </div>

            <div class="col-xl-3 col-lg-3 col-md-3 col-sm-12 col-xs-12">

                <div class="card">

                    <div class="card-statistic-4">

                        <div class="align-items-center justify-content-between">

                            <div class="row ">

                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pr-0 ">

                                    <div class="card-icon2 mainbg">

                                        <i class="fas fa-user maincolor"></i>

                                    </div>

                                    <div class="card-content">

                                        <h5 class="font-15 mt-3">{{ __('new_user_weekly') }}</h5>

                                        <h3 class="mb-3 ">{{ $weekly_user }}</h3>



                                    </div>

                                </div>



                            </div>

                        </div>

                    </div>

                </div>

            </div>

            <div class="col-xl-3 col-lg-3 col-md-3 col-sm-12 col-xs-12">

                <div class="card">

                    <div class="card-statistic-4">

                        <div class="align-items-center justify-content-between">

                            <div class="row ">

                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pr-0 ">

                                    <div class="card-icon2 mainbg">

                                        <i class="fas fa-user maincolor"></i>

                                    </div>

                                    <div class="card-content">

                                        <h5 class="font-15 mt-3">{{ __('new_user_monthly') }}</h5>

                                        <h3 class="mb-3 ">{{ $monhtly_user }}</h3>



                                    </div>

                                </div>



                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </div>
    </div>
<div class="col-12">
    <h4>{{ __('numbers_of_subscriber') }}</h4>
    <div class="row">
        <div class="col-xl-3 col-lg-3 col-md-3 col-sm-12 col-xs-12">

            <div class="card">

                <div class="card-statistic-4">

                    <div class="align-items-center justify-content-between">

                        <div class="row ">

                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pr-0 ">

                                <div class="card-icon2 mainbg">

                                    <i class="fas fa-user maincolor"></i>

                                </div>

                                <div class="card-content">

                                    <h5 class="font-15 mt-3">{{ __('all_subscribers') }}</h5>

                                    <h3 class="mb-3 total_sub">{{ $total_sub }}</h3>



                                </div>

                            </div>



                        </div>

                    </div>

                </div>

            </div>
        </div>

        <div class="col-xl-3 col-lg-3 col-md-3 col-sm-12 col-xs-12">

            <div class="card">

                <div class="card-statistic-4">

                    <div class="align-items-center justify-content-between">

                        <div class="row ">

                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pr-0 ">

                                <div class="card-icon2 mainbg">

                                    <i class="fas fa-user maincolor"></i>

                                </div>

                                <div class="card-content">

                                    <h5 class="font-15 mt-3">{{ __('new_subscribers_today') }}</h5>

                                    <h3 class="mb-3 ">{{ $today_sub }}</h3>



                                </div>

                            </div>



                        </div>

                    </div>

                </div>

            </div>

        </div>

        <div class="col-xl-3 col-lg-3 col-md-3 col-sm-12 col-xs-12">

            <div class="card">

                <div class="card-statistic-4">

                    <div class="align-items-center justify-content-between">

                        <div class="row ">

                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pr-0 ">

                                <div class="card-icon2 mainbg">

                                    <i class="fas fa-user maincolor"></i>

                                </div>

                                <div class="card-content">

                                    <h5 class="font-15 mt-3">{{ __('new_subscribers_weekly') }}</h5>

                                    <h3 class="mb-3 ">{{ $weekly_sub }}</h3>



                                </div>

                            </div>



                        </div>

                    </div>

                </div>

            </div>

        </div>

        <div class="col-xl-3 col-lg-3 col-md-3 col-sm-12 col-xs-12">

            <div class="card">

                <div class="card-statistic-4">

                    <div class="align-items-center justify-content-between">

                        <div class="row ">

                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pr-0 ">

                                <div class="card-icon2 mainbg">

                                    <i class="fas fa-user maincolor"></i>

                                </div>

                                <div class="card-content">

                                    <h5 class="font-15 mt-3">{{ __('new_subscribers_monthly') }}</h5>

                                    <h3 class="mb-3 ">{{ $monhtly_sub }}</h3>



                                </div>

                            </div>



                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>

</div>

<div class="col-12">
    <div class="row">
        <div class="col-12 col-md-6">
            <div class="card">
                <div class="card-header">
                    <h4>{{ __('users') }}</h4>
                </div>
                <div class="card-body">
                    <div class="row">
                    <div class="col-12 col-md-4">
                        <div class="form-group">
                            <label>{{ __('gender') }}</label>
                            <select id="user_gender" name="type" class="form-control user_gender" required>
                                <option value="all">{{ __('all') }}</option>
                                <option value="male">{{ __('male') }}</option>
                                <option value="female">{{ __('female') }}</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-12 col-md-4">
                        <div class="form-group">
                            <label>{{ __('duration') }}</label>
                            <select id="user_duration" name="type" class="form-control user_duration" required>
                                <option value="all">{{ __('all') }}</option>
                                <option value="weekly">{{ __('weekly') }}</option>
                                <option value="monthly">{{ __('monthly') }}</option>
                            </select>
                        </div>
                    </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped w-100" id="UsersTable">
                            <thead>
                                <tr>
                                    <th>{{ __('age_range') }}</th>
                                    <th>{{ __('nationality') }}</th>
                                    <th>{{ __('counter') }}</th>
                                    <th>{{ __('percentage') }}</th>
                                </tr>
                            </thead>
                            <tbody>
                                
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>
        <div class="col-12 col-md-6">
            <div class="card">
                <div class="card-header">
                    <h4>{{ __('subscription') }}</h4>
                </div>
                <div class="card-body">
                    <div class="row">
                    <div class="col-12 col-md-4">
                        <div class="form-group">
                            <label>{{ __('gender') }}</label>
                            <select id="sub_gender" name="type" class="form-control sub_gender" required>
                                <option value="all">{{ __('all') }}</option>
                                <option value="male">{{ __('male') }}</option>
                                <option value="female">{{ __('female') }}</option>
                            </select>
                        </div>
                    </div>
                     <div class="col-12 col-md-4">
                        <div class="form-group">
                            <label>{{ __('duration') }}</label>
                            <select id="sub_duration" name="type" class="form-control sub_duration" required>
                                <option value="all">{{ __('all') }}</option>
                                <option value="weekly">{{ __('weekly') }}</option>
                                <option value="monthly">{{ __('monthly') }}</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-12 col-md-4">
                        <div class="form-group">
                            <label>{{ __('type_of_subscripcion') }}</label>
                            <select id="sub_type" name="type" class="form-control sub_type" required>
                                <option value="all">{{ __('all') }}</option>
                                <option value="gold">{{ __('gold') }}</option>
                                <option value="premium">{{ __('premium') }}</option>
                            </select>
                        </div>
                    </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped w-100" id="subTable">
                            <thead>
                                <tr>
                                    <th>{{ __('age_range') }}</th>
                                    <th>{{ __('nationality') }}</th>
                                    <th>{{ __('subscripcion_count') }}</th>
                                    <th>{{ __('percentage') }}</th>
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

<div class="col-12">
    <div class="row">
        <div class="col-12 col-md-6">
            <div class="card">
                <div class="card-header">
                    <h4>{{ __('sexual_orientations') }}</h4>
                </div>
                <div class="card-body">
                    <div class="row">
                    <div class="col-12 col-md-4">
                        <div class="form-group">
                            <label>{{ __('gender') }}</label>
                            <select id="sexual_orientations_gender" name="type" class="form-control sexual_orientations_gender" required>
                                <option value="all">{{ __('all') }}</option>
                                <option value="male">{{ __('male') }}</option>
                                <option value="female">{{ __('female') }}</option>
                            </select>
                        </div>
                    </div>
                   <div class="col-12 col-md-4">
                        <div class="form-group">
                            <label>{{ __('sexual_orientations') }}</label>
                            <select id="sexual_orientations" name="sexual_orientations" class="form-control sexual_orientations_gender" required>
                                @foreach($orientation as $key=>$value)
                                <option value="{{$key}}">{{$value}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped w-100" id="sexualOrientationsTable">
                            <thead>
                                <tr>
                                    <th>{{ __('age_range') }}</th>
                                    <th>{{ __('nationality') }}</th>
                                    <th>{{ __('percentage') }}</th>
                                </tr>
                            </thead>
                            <tbody>
                                
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>
        <div class="col-12 col-md-6">
            <div class="card">
                <div class="card-header">
                    <h4>{{ __('looking_for') }}</h4>
                </div>
                <div class="card-body">
                    <div class="row">
                    <div class="col-12 col-md-4">
                        <div class="form-group">
                            <label>{{ __('gender') }}</label>
                            <select id="looking_for_gender" name="type" class="form-control looking_for_gender" required>
                                <option value="all">{{ __('all') }}</option>
                                <option value="male">{{ __('male') }}</option>
                                <option value="female">{{ __('female') }}</option>
                            </select>
                        </div>
                    </div>
                         <div class="col-12 col-md-4">
                        <div class="form-group">
                            <label>{{ __('looking_for') }}</label>
                            <select id="looking_for" name="looking_for" class="form-control looking_for" required>
                                @foreach($looking_for as $key=>$value)
                                <option value="{{$key}}">{{$value}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped w-100" id="LookingForTable">
                            <thead>
                                <tr>
                                    <th>{{ __('age_range') }}</th>
                                    <th>{{ __('nationality') }}</th>
                                    <th>{{ __('percentage') }}</th>
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

@section('script')
<script>
    // User gender change event
$(document).ready(function () {
    // User table
    $("#user_gender,#user_duration").change(function () {
        user_gender = $('#user_gender').val();
        user_duration = $('#user_duration').val();
        $.ajax({
        url: "{{route('index')}}",
        type: "POST",
        dataType: "json",
        data: { type: "users", gender: user_gender,user_duration: user_duration },
        success: function (result) {
            console.log(result);
            total_sub = $(".total_user").text();
            $("#UsersTable").find("tbody").empty();
            $.each(result, function (index, value) {
            $("#UsersTable")
                .find("tbody")
                .append(
                "<tr><td>" +value.age_group + "</td><td>" + value.country_code + "</td><td>" + value.count + "</td><td>" + `${((value.count * 100) / total_sub).toFixed(2)} %` + "</td></tr>"
                );
            });
        },
        });
    });

    // Subscribition table
     $("#sub_gender,#sub_duration, #sub_type").change(function () {
        sub_gender = $('#sub_gender').val();
        sub_duration = $('#sub_duration').val();
        sub_type = $('#sub_type').val();
        $.ajax({
        url: "{{route('index')}}",
        type: "POST",
        dataType: "json",
        data: { type: "sub", gender: sub_gender,sub_duration: sub_duration, sub_type:sub_type },
        success: function (result) {
            console.log(result);
            total_user = $(".total_sub").text();
            $("#subTable").find("tbody").empty();
            $.each(result, function (index, value) {
            $("#subTable")
                .find("tbody")
                .append(
                "<tr><td>" +value.age_group + "</td><td>" + value.country_code + "</td><td>" + value.count + "</td><td>" + `${Math.trunc((value.count * 100) / total_user)} %` + "</td></tr>"
                );
            });
        },
        });
    });

    // sexualOrientationsTable table
     $("#sexual_orientations_gender,#sexual_orientations").change(function () {
        sexual_orientations_gender = $('#sexual_orientations_gender').val();
        $.ajax({
        url: "{{route('index')}}",
        type: "POST",
        dataType: "json",
        data: { type: "sexual_orientations", gender: sexual_orientations_gender,sexual_orientations:$('#sexual_orientations').val()},
        success: function (result) {
            console.log(result);
            total_user = $(".total_user").text();
            $("#sexualOrientationsTable").find("tbody").empty();
            $.each(result, function (index, value) {
            $("#sexualOrientationsTable")
                .find("tbody")
                .append(
                "<tr><td>" +value.age_group + "</td><td>" + value.country_code + "</td><td>" + `${Math.trunc((value.count * 100) / total_user)} %` + "</td></tr>"
                );
            });
        },
        });
    });

    // Looking For table
     $("#looking_for_gender,#looking_for").change(function () {
        looking_for_gender = $('#looking_for_gender').val();
        $.ajax({
        url: "{{route('index')}}",
        type: "POST",
        dataType: "json",
        data: { type: "looking_for", gender: looking_for_gender,looking_for:$('#looking_for').val()},
        success: function (result) {
            console.log(result);
            total_user = $(".total_user").text();
            $("#LookingForTable").find("tbody").empty();
            $.each(result, function (index, value) {
            $("#LookingForTable")
                .find("tbody")
                .append(
                "<tr><td>" +value.age_group + "</td><td>" + value.country_code + "</td><td>" + `${Math.trunc((value.count * 100) / total_user)} %` + "</td></tr>"
                );
            });
        },
        });
    });

    $('#user_gender').trigger('change');
    $('#sub_gender').trigger('change');
    $('#sexual_orientations_gender').trigger('change');
    $('#looking_for_gender').trigger('change');
});

// $.ajax({
//   url: "{{route('index')}}",
//   type: "POST",
//   dataType: "json",
//   data: { type: "users" },
//   success: function (result) {
//     console.log(result);

//     var total_user = $(".total_user").text();
//     $("#UsersTable").find("tbody").empty();
//     $.each(result, function (index, value) {
//       $("#UsersTable")
//         .find("tbody")
//         .append(
//          "<tr><td>" +value.age_group + "</td><td>" + "" + "</td><td>" + value.count + "</td><td>" + `${Math.trunc((value.count * 100) / total_user)} %` + "</td></tr>"
//         );
//     });
//   },
// });
</script>  
@endsection


