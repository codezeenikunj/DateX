@extends('include.app')
@section('header')
    <script src="{{ asset('asset/script/addfakeuser.js') }}"></script>
    <link rel="stylesheet" href="{{ asset('asset/style/addFakeUser.css') }}">
@endsection

@section('content')
    <style>
        .iconformusic i {
            font-size: 40px !important;
            margin-top: 5px;
            color: black;

        }

        .dropbtn {
            width: 100%;
            background-color: #3e8e41;
            cursor: pointer;
            padding: 10px;
        }



        #myInput {
            box-sizing: border-box;

            font-size: 14px;
            padding-left: 25px;
            border: none;
            width: 100%;

        }

        #myArtInput {
            box-sizing: border-box;

            font-size: 14px;
            padding-left: 25px;
            border: none;
            width: 100%;

        }

        #myInput {
            outline: none;
        }

        #myArtInput:focus {
            outline: none;
        }

        .dropdown {
            position: relative;
            display: inline-block;
            width: 100%;


        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f6f6f6;
            width: 100%;
            border-radius: 5px;
            overflow: hidden;
            margin-top: -58px;
            border: 1px solid #ddd;
            max-height: 250px;
            z-index: 1;
        }

        .dropdown-content option {
            color: black;
            padding: 5px 16px;
            text-decoration: none;
            display: block;
        }

        .hk::-webkit-scrollbar-track {
            -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
            background-color: #F5F5F5;
        }

        .hk::-webkit-scrollbar {
            width: 10px;
            background-color: #F5F5F5;
        }

        .hk::-webkit-scrollbar-thumb {
            background-color: #4F5ECE;
            background-image: -webkit-linear-gradient(45deg,
                    rgba(255, 255, 255, .2) 25%,
                    transparent 25%,
                    transparent 50%,
                    rgba(255, 255, 255, .2) 50%,
                    rgba(255, 255, 255, .2) 75%,
                    transparent 75%,
                    transparent)
        }



        .show {
            display: block;
        }

        .active {
            background-color: #4F5ECE;
            color: white !important;
            border-radius: 10px;
        }

        .closeicon {
            font-size: 20px;
            padding: 10px;
            background-color: white;
            color: black !important;

        }

        .closeArtistIcon {
            font-size: 20px;
            padding: 10px;
            background-color: white;
            color: black !important;

        }

        .hk {
            overflow-y: scroll;
            padding: 0px 10px;
            max-height: 200px;
        }

        .list li {
            list-style: none;
            padding: 6px 10px;
            background-color: #4F5ECE;
            margin-right: 10px;
            color: white !important;
            border-radius: 5px;
            /* background-color: #4F5ECE; */
            width: fit-content;
        }

        .list li i {
            margin-left: 10px;
        }
    </style>

    <div class="card">
        <div class="card-header">
            <h4>
                {{ __('Add Fake User') }}
            </h4>

        </div>

        <div class="card-body">

            <form action="" method="post" enctype="multipart/form-data" class="addFakeUser" id="addForm"
                autocomplete="off">
                @csrf

                {{-- Image part --}}
                <div id="photo_gallery2" class=" row ml-1">

                </div>

                <div id="imgInput" class="form-group">
                    <label for="productimages">
                        <a class="btn btn-primary text-white">Add Image</a>
                    </label>
                    <input type="file" class="form-control d-none" id="productimages" name="image"
                        accept="image/x-png,image/gif,image/jpeg" multiple>
                </div>
                {{-- Other field start --}}

                <div class="form-row mt-3">
                    <div class="form-group col-3">
                        <label>{{ __('first_name') }}</label>
                        <input id="first_name" class="form-control" name="first_name" value="" required>
                    </div>
                    <div class="form-group col-3">
                        <label>{{ __('last_name') }}</label>
                        <input id="last_name" class="form-control" name="last_name" value="" required>
                    </div>
                      <div class="form-group col-3">
                        <label for="country_code">{{ __('country_code') }}</label>
                        <select id="country_code" class="form-control form-control-sm" name="country_code" aria-label="Default select example">
                           
                        </select>
                    </div>
                    <div class="form-group col-3">
                        <label>{{ __('mobile_no') }}</label>
                        <input id="location" class="form-control" name="mobile_number" value="" required>
                    </div>
                    <div class="form-group col-3">
                        <label>{{ __('email') }}</label>
                        <input id="email" class="form-control" name="email" value="">
                    </div>
                    <div class="form-group col-3">
                        <label>{{ __('birth_date') }}</label>
                        <input id="birth_date" type="date" class="form-control" name="birth_date" value="" required>
                    </div>
                    <div class="form-group col-3">
                        <label for="gender">{{ __('gender') }}</label>
                        <select id="gender" class="form-control form-control-sm" name="gender" aria-label="Default select example">
                            <option value="1">{{ __('male') }}</option>
                            <option value="2">{{ __('female') }}</option>
                            <option value="2">{{ __('other') }}</option>
                        </select>
                    </div>
                </div>
            

               

                <div class="form-group mt-5">
                    <input class="btn btn-primary mr-1" type="submit" value=" {{ __('Submit') }}">
                </div>

            </form>

        </div>
    </div>
@endsection
