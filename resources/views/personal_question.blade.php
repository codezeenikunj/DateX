@extends('include.app')



@section('header')

    <script src="{{ asset('asset/script/personal_question.js') }}"></script>

@endsection



@section('content')

    <div class="modal fade" id="addcat" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

        <div class="modal-dialog modal-dialog-centered" role="document">

            <div class="modal-content">

                <div class="modal-header">

                    <div class=" ">

                        <h5>{{ __('add_personal_question') }}</h5>

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

                                <input type="text" id="perq_title" name="title" class="form-control" required>

                            </div>



                            <div class="form-group">

                                <label>{{ __('question') }}</label>

                                <input type="text" id="perq_question" name="question" class="form-control" required>

                            </div>

                            <div class="form-group">

                                <label>{{ __('type') }}</label>

                                <select id="perq_type" name="type" class="form-control" required>

                                    <option value="lifestyle">Lifestyle</option>

                                    <option value="about_me">About me</option>

                                </select>

                            </div>



                            <div class="form-group">

                            <label for="">{{ __('image') }}</label>

                            <input type="file" class="form-control" id="perq_image" name="image" required>

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

            <h4>{{ __('personal_question') }}</h4>

            <a class="btn btn-primary personal_questionaddModalbtn ml-auto" href="" data-toggle="modal"

                data-target="#addcat">{{ __('add_personal_question') }}

            </a>

        </div>

        <div class="card-body">

            <div class="table-responsive">

                <table class="table table-striped w-100" id="personal_questionTable">

                    <thead>

                        <tr>

                            <th>{{ __('type') }}</th>

                            <th>{{ __('app.Title') }}</th>

                            <th>{{ __('question') }}</th>

                            <th>{{ __('image') }}</th>

                            <th>{{ __('action') }}</th>



                        </tr>

                    </thead>

                    <tbody>



                    </tbody>

                </table>

            </div>

        </div>

    </div>





    <div class="modal fade" id="edit_perq_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"

        aria-hidden="true">

        <div class="modal-dialog " role="document">

            <div class="modal-content">

                <div class="modal-header">

                    <h5 class="modal-title" id="exampleModalLabel">{{ __('edit_personal_question') }}</h5>

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

                            <input type="text" class="form-control" id="editperq_title" name="title" required>

                        </div>

                        <div class="form-group">

                                <label>{{ __('question') }}</label>

                                <input type="text" id="editperq_question" name="question" class="form-control" required>

                        </div>

                        <div class="form-group editperq_type">

                                <label>{{ __('type') }}</label>

                                <select id="editperq_type" name="type" class="form-control" required>

                                    <option value="lifestyle">Lifestyle</option>

                                    <option value="about_me">About me</option>

                                </select>

                        </div>

                         <div class="form-group editperq_image">

                            <label for="">{{ __('image') }}</label>

                            <input type="file" class="form-control" id="editperq_image" name="image">

                        </div>    



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



@section('script')



@endsection