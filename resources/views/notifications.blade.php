@extends('include.app')
@section('header')
    <script src="{{ asset('asset/script/notification.js') }}"></script>
@endsection
@section('content')
    <div class="card">
        <div class="card-header">
            <h4>{{ __('notifications') }}</h4>
            <a class="btn btn-primary addModalBtn ml-auto" data-toggle="modal" data-target="#addcat"
                href="">{{ __('send_notification') }}
            </a>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-striped" id="table-22">
                    <thead>
                        <tr>
                            <th> {{ __('title') }}</th>
                            <th> {{ __('message') }}</th>
                            <th> {{ __('action') }}</th>
                        </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="modal fade" id="addcat" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">

                    <h5>{{ __('send_notification') }}</h5>

                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <form action="" method="post" enctype="multipart/form-data" class="add_category" id="addForm"
                        autocomplete="off">
                        @csrf
                        <div class="form-group">
                            <label> {{ __('title') }}</label>
                            <input type="text" name="title" class="form-control" required>
                        </div>


                        <div class="form-group">
                            <label> {{ __('message') }}</label>
                            <textarea type="text" name="message" class="form-control" required></textarea>
                        </div>

                        <div class="form-group">
                            <input class="btn btn-primary mr-1" type="submit" value=" {{ __('send_notification') }}">
                        </div>

                    </form>
                </div>

            </div>
        </div>
    </div>


    <div class="modal fade" id="edit_cat_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"> {{ __('edit_notification') }}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="" method="post" enctype="multipart/form-data" id="edit_cat" autocomplete="off">

                        @csrf
                        <input type="hidden" class="form-control" id="editId" name="id" value="">

                        <div class="form-group">
                            <label>{{ __('title') }}</label>
                            <input type="text" name="title" id="title" class="form-control" required>
                        </div>

                        <div class="form-group">
                            <label> {{ __('message') }}</label>
                            <textarea type="text" id="edit_message" name="message" class="form-control" required></textarea>
                        </div>


                        <div class="form-group">
                            <input type="submit" class=" btn btn-primary">
                        </div>

                    </form>
                </div>

            </div>
        </div>
    </div>
@endsection
