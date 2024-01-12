@extends('include.app')



@section('header')

    <script src="{{ asset('asset/script/looking.js') }}"></script>

@endsection



@section('content')

    <div class="modal fade" id="addcat" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

        <div class="modal-dialog modal-dialog-centered" role="document">

            <div class="modal-content">

                <div class="modal-header">

                    <div class=" ">

                        <h5>{{ __('add_looking') }} </h5>

                    </div>

                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">

                        <span aria-hidden="true">&times;</span>

                    </button>

                </div>

                <div class="modal-body">







                    <div class="">

                        <form action="" method="post" enctype="multipart/form-data" class="add_category"

                            id="addForm" autocomplete="off">

                            @csrf

                            <div class="form-group">

                                <label>{{ __('title') }} </label>

                                <input type="text" id="cat_title" name="title" class="form-control" required>

                            </div>

                            <div class="form-group text-right">

                                <input class="btn btn-success mr-1" type="submit" id="addcat2"

                                    value="{{ __('submit') }}">

                                <a href="#" class="btn btn-light text-dark" data-dismiss="modal"

                                    aria-label="Close">{{ __('close') }} </a>

                            </div>



                        </form>





                    </div>







                </div>



            </div>

        </div>

    </div>









    <div class="card">

        <div class="card-header">

            <h4>Looking</h4>

            <a class="btn btn-primary lookingsaddModalbtn ml-auto" href="" data-toggle="modal"

                data-target="#addcat">{{ __('add_looking') }}

            </a>

        </div>

        <div class="card-body">

            <div class="table-responsive">

                <table class="table table-striped w-100" id="lookingTable">

                    <thead>

                        <tr>

                            <th>{{ __('title') }}</th>

                            <th>{{ __('action') }}</th>

                        </tr>

                    </thead>

                    <tbody>



                    </tbody>

                </table>

            </div>

        </div>

    </div>





    <div class="modal fade" id="edit_cat_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"

        aria-hidden="true">

        <div class="modal-dialog " role="document">

            <div class="modal-content">

                <div class="modal-header">

                    <h5 class="modal-title" id="exampleModalLabel">{{ __('edit_looking') }}</h5>

                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">

                        <span aria-hidden="true">&times;</span>

                    </button>

                </div>

                <div class="modal-body">

                    <form action="" method="post" enctype="multipart/form-data" id="edit_cat" autocomplete="off">



                        @csrf

                        <input type="hidden" class="form-control" id="editcatid" name="id" value="">



                         <input type="hidden" class="form-control" id="lang" name="lang" value="">



                        <div class="form-group">

                            <label for="">{{ __('title') }}</label>

                            <input type="text" class="form-control" id="editcat_title" name="title" required>

                        </div>

                      {{--   <div class="form-group">

                        <label for="">{{ __('Language') }}</label>

                        <select name="looking_lang" class="form-control">



                            @foreach($lang as $key=>$value)

                            <option value="{{$value->short_code}}">{{$value->language_name}}</option>

                            @endforeach

                        </select>

                         </div>    --}}

                       {{--   <div class="form-group editcat_image">

                            <label for="">{{ __('app.Image') }}</label>

                            <input type="file" class="form-control" id="editcat_image" name="image">

                        </div>     --}}



                        <div class="form-group text-right">

                            <input type="submit" value="{{ __('submit') }}" class=" btn btn-success" id="editcat2">

                            <a href="#" class="btn btn-light text-dark" data-dismiss="modal"

                                aria-label="Close">{{ __('close') }}</a>

                        </div>



                    </form>

                </div>



            </div>

        </div>

    </div>

@endsection