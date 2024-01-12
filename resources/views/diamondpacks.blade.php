@extends('include.app')
@section('header')
    <script src="{{ asset('asset/script/diamondpacks.js') }}?v={{now()}}"></script>
@endsection
@section('content')
    <div class="card">
        <div class="card-header">
            <h4>{{ __('plans') }}</h4>
            <a class="btn btn-primary addModalBtn ml-auto" data-toggle="modal" data-target="#addcat"
                href="">{{ __('add_plan') }}
            </a>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-striped" id="table-22">
                    <thead>
                        <tr>
                            <th> {{ __('type') }}</th>
                            <th> {{ __('name') }}</th>
                            <th> {{ __('price') }}</th>
                            <th> {{ __('limited_time') }}</th>
                            <th> {{ __('limit') }}</th>
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

                    <h5>{{ __('add_plan') }}</h5>

                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <form action="" method="post" enctype="multipart/form-data" class="add_category" id="addForm"
                        autocomplete="off">
                        @csrf
                        <div class="form-group">
                            <label>{{ __('type') }}</label>
                            <select id="plan_type" name="type" class="form-control plan_type" required>
                                <option value="">{{ __('select_plan_type') }}</option>
                                <option value="premium">{{ __('premium') }}</option>
                                <option value="gold">{{ __('gold') }}</option>
                                <option value="boosts">{{ __('boosts') }}</option>
                                <option value="super_likes">{{ __('super_likes') }}</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>{{ __('name') }}</label>
                            <input type="text" name="name" id="name" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>{{ __('description') }}</label>
                            <textarea class="form-control" name="description" id="description" placeholder="Description"></textarea>
                        </div>
                        <div class="form-group">
                            <label> {{ __('price') }}</label>
                            <input type="number" name="price" id="price" step="0.10" class="form-control" required>
                        </div>
                        <div class="form-group features">
                            <label> {{ __('duration') }}</label>
                            <input type="number" name="duration" id="duration" class="form-control" placeholder="Enter In Days">
                        </div>

                        <div class="form-group features">
                            <label>{{ __('feature') }}</label>
                            <textarea class="form-control" name="metadata" id="metadata" placeholder="Multiple Features Add In Using ,"></textarea>
                        </div>
                        
                        <div class="form-group features">
                            <label>Free Boost</label>
                            <input type="number" name="free_boost" id="free_boost" class="form-control">
                        </div>
                        <div class="form-group features">
                            <label>Boost Duration</label>
                            <select id="boost_duration" name="boost_duration" class="form-control" required>
                                <option value="weekly">{{ __('weekly') }}</option>
                                <option value="monthly">{{ __('monthly') }}</option>
                            </select>
                        </div>
                        <div class="form-group features">
                            <label>Free Superlike</label>
                            <input type="number" name="free_superlike" id="free_superlike" class="form-control">
                        </div>
                        <div class="form-group features">
                            <label>Superlike Duration</label>
                            <select id="superlike_duration" name="superlike_duration" class="form-control" required>
                                <option value="weekly">{{ __('weekly') }}</option>
                                <option value="monthly">{{ __('monthly') }}</option>
                            </select>
                        </div>
                        <div class="form-group limit" style="display: none;">
                            <label>{{ __('limit') }}</label>
                            <input type="number" name="limited" id="limit" class="form-control">
                        </div>
                        <div class="form-group">
                            <input class="btn btn-primary mr-1" type="submit" value="Add Plan">
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
                    <h5 class="modal-title" id="exampleModalLabel"> {{ __('edit_plan') }}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="" method="post" enctype="multipart/form-data" id="edit_cat" autocomplete="off">

                        @csrf
                        <input type="hidden" class="form-control" id="editId" name="id" value="">
                        <div class="form-group">
                            <label>{{ __('type') }}</label>
                            <select id="edit_plan_type" name="type" class="form-control plan_type" required>
                                <option value="">{{ __('select_plan_type') }}</option>
                                <option value="premium">{{ __('premium') }}</option>
                                <option value="gold">{{ __('gold') }}</option>
                                <option value="boosts">{{ __('boosts') }}</option>
                                <option value="super_likes">{{ __('super_likes') }}</option>
                            </select>
                        </div>
                         <div class="form-group">
                            <label>{{ __('name') }}</label>
                            <input type="text" name="name" id="edit_name" class="form-control" required>
                        </div>
                         <div class="form-group">
                            <label>{{ __('description') }}</label>
                            <textarea class="form-control" name="description" id="edit_description" placeholder="Description"></textarea>
                        </div>
                        <div class="form-group">
                           <label> {{ __('price') }}</label>
                            <input type="number" name="price" id="edit_price" step="0.10" class="form-control" required>
                        </div>
                        <div class="form-group features">
                           <label> {{ __('duration') }}</label>
                            <input type="number" name="duration" id="edit_duration" class="form-control" placeholder="Enter In Days">
                        </div>

                        <div class="form-group features">
                            <label>{{ __('feature') }}</label>
                            <textarea class="form-control" id="edit_features" name="metadata" placeholder="Multiple Features Add In Using ,"></textarea>
                    
                        </div>
                        <div class="form-group features">
                            <label>Free Boost</label>
                            <input type="number" name="free_boost" id="edit_free_boost" class="form-control">
                        </div>
                        <div class="form-group features">
                            <label>Boost Duration</label>
                            <select id="edit_boost_duration" name="boost_duration" class="form-control" required>
                                <option value="weekly">{{ __('weekly') }}</option>
                                <option value="monthly">{{ __('monthly') }}</option>
                            </select>
                        </div>
                        <div class="form-group features">
                            <label>Free Superlike</label>
                            <input type="number" name="free_superlike" id="edit_free_superlike" class="form-control">
                        </div>
                        <div class="form-group features">
                            <label>Superlike Duration</label>
                            <select id="edit_superlike_duration" name="superlike_duration" class="form-control" required>
                                <option value="weekly">{{ __('weekly') }}</option>
                                <option value="monthly">{{ __('monthly') }}</option>
                            </select>
                        </div>
                        <div class="form-group limit" style="display: none;">
                            <label>{{ __('limit') }}</label>
                            <input type="number"  id="edit_limit" name="limited" class="form-control">
                        </div>
                        <div class="form-group">
                            <input type="submit" class=" btn btn-primary">
                        </div>

                    </form>
                </div>

            </div>
        </div>
    </div>


    <div class="modal fade" id="lang_edit_cat_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"> {{ __('edit_plan') }}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="" method="post" enctype="multipart/form-data" id="lang_edit_cat" autocomplete="off">

                        @csrf
                        <input type="hidden" class="form-control" id="lang_editid" name="id" value="">
                        <input type="hidden" class="form-control" id="lang" name="lang" value="">
                         <div class="form-group">
                            <label>{{ __('name') }}</label>
                            <input type="text" name="name" id="lang_edit_name" class="form-control" required>
                        </div>
                         <div class="form-group">
                            <label>{{ __('description') }}</label>
                            <textarea class="form-control" name="description" id="lang_edit_description" placeholder="Description"></textarea>
                        </div>
                        <div class="form-group lang_edit_features">
                            <label>{{ __('feature') }}</label>
                            <textarea class="form-control" id="lang_edit_features" name="metadata" placeholder="Multiple Features Add In Using ,"></textarea>
                    
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
