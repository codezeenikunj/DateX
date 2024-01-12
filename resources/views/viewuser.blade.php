@extends('include.app')

@section('header')
    <script src="{{ asset('asset/script/viewuser.js') }}"></script>
    <link rel="stylesheet" href="{{ asset('asset/style/addFakeUser.css') }}">
@endsection

@section('content')
    <div class="card">
        <div class="card-header">
            <h4>
                {{$data['first_name']}} {{$data['last_name']}}
               
            </h4>

            <div class="d-flex ml-auto">
                <?php if ($data['gender'] == 1) {
                    echo "<h2 class='btn btn-primary'>" . __('male') . '</h2>';
                } else {
                    echo "<h2 class='btn btn-primary'>" . __('female') . '</h2>';
                }
                ?>
                <?php if ($data['is_block'] == 1) {
                    echo "<h2 class='btn btn-success ml-2 unblock' rel='" . $data['id'] . "'>" . __('unblock') . '</h2>';
                } else {
                    echo "<h2 class='btn btn-danger ml-2  block' rel='" . $data['id'] . "'>" . __('block') . '</h2>';
                }
                ?>
             


            </div>
        </div>

        <div class="card-body">

            <div class="form-row mb-3 ">
                @foreach ($data['images'] as $image)
                    {{-- <img class="rounded m-1 " src="{{ env('image') }}{{ $image->image }}" width="130" height="130"> --}}
                    <div class="borderwrap2 " data-href="">
                        <div class="filenameupload2">
                            <img class="rounded " src="{{ $image->image }}" width="130"
                                height="130">
                            <div data-imgid="{{ $image->id }}" class="middle btnRemove"><i
                                    class="material-icons remove_img2">cancel</i>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>

            <div class="mb-4">
                <button id="btnAddImage" class="btn btn-primary">{{ __('add_image') }}</button>
            </div>

            <form method="post" class="" action="" id="userUpdate" enctype="multipart/form-data">
                @csrf

                <input class=" form-control" readonly name="id" value="{{ $data['id'] }}" type="text"
                    id="userId" hidden>

                <div class="form-row">
                    <div class="form-group col-md-6">
                            <label>{{ __('identity') }}</label>
                            <input name="identity" class="form-control" value="{{ $data['identity'] }}" readonly>
                        </div>
                   
               
                    <div class="form-group col-3">
                        <label>{{ __('first_name') }}</label>
                        <input id="first_name" class="form-control" name="first_name" value="{{$data['first_name']}}" required>
                    </div>
                    <div class="form-group col-3">
                        <label>{{ __('last_name') }}</label>
                        <input id="last_name" class="form-control" name="last_name" value="{{$data['last_name']}}">
                    </div>
                      <div class="form-group col-3">
                        <label for="country_code">{{ __('country_code') }}</label>
                        <select id="country_code" data-selected="{{$data['country_code']}}" class="form-control form-control-sm" name="country_code" aria-label="Default select example" readonly>
                           
                        </select>
                    </div>
                    <div class="form-group col-3">
                        <label>{{ __('mobile_no') }}</label>
                        <input id="mobile_number" class="form-control" name="mobile_number" value="{{$data['mobile_number']}}" readonly>
                    </div>
                    <div class="form-group col-3">
                        <label>{{ __('email') }}</label>
                        <input id="email" class="form-control" name="email" value="{{$data['email']}}">
                    </div>
                    <div class="form-group col-3">
                        <label>{{ __('birth_date') }}</label>
                        <input id="birth_date" type="date" class="form-control" name="birth_date" value="{{$data['birth_date']}}" required>
                    </div>
                    <div class="form-group col-3">
                        <label for="gender">{{ __('gender') }}</label>
                        <select id="gender" class="form-control form-control-sm" name="gender" aria-label="Default select example">
                            <option value="1" {{$data['gender']==1?'selected':''}}>{{ __('male') }}</option>
                            <option value="2" {{$data['gender']==2?'selected':''}}>{{ __('female') }}</option>
                            <option value="3" {{$data['gender']==3?'selected':''}}>{{ __('other') }}</option>
                        </select>
                    </div>
                </div>
                <div class="form-row">
                    <button type="submit" class="btn btn-primary">{{ __('submit') }}</button>
                </div>

            </form>

        </div>


    </div>

    <div class="modal fade" id="addImageModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">

                    <h5>{{ __('add_image') }}</h5>

                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <form action="" method="post" enctype="multipart/form-data" class="add_category" id="addForm"
                        autocomplete="off">
                        @csrf
                        <input class=" form-control" readonly name="id" value="{{ $data['id'] }}" type="text"
                            id="userId" hidden>

                        <div class="form-group">
                            <div class="mb-3">
                                <label for="gift_image" class="form-label">{{ __('image') }}</label>
                                <input id="gift_image" class="form-control" type="file"
                                    accept="image/png, image/gif, image/jpeg" name="image" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <input class="btn btn-primary mr-1" type="submit" value=" {{ __('submit') }}">
                        </div>

                    </form>
                </div>

            </div>
        </div>
    </div>
@endsection
