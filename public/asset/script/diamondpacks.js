$(document).ready(function () {
    $(".sideBarli").removeClass("activeLi");
    $(".diamondpackSideA").addClass("activeLi");

    $(".addModalBtn").on("click", function (event) {
        event.preventDefault();
        $("#addForm")[0].reset();
    });


    $("#table-22").dataTable({
        processing: true,
        serverSide: true,
        serverMethod: "post",
        aaSorting: [[0, "desc"]],
        columnDefs: [
            {
                targets: [0, 1, 2],
                orderable: false,
            },
        ],
        ajax: {
            url: `${domainUrl}fetchDiamondPackages`,
            data: function (data) {},
        },
    });

     $(".plan_type").on('change',function(){
        if($(this).val()=='boosts' || $(this).val()=='super_likes'){
            $('.features').hide();
            $('.limit').show();
        }else{
            $('.features').show();
            $('.limit').hide();
        }
     });

    $("#addForm").on("submit", function (event) {
        event.preventDefault();
        $(".loader").show();

        if (user_type == "1") {
            var formdata = new FormData($("#addForm")[0])

            $.ajax({
                url: `${domainUrl}addDiamondPack`,
                type: "POST",
                data: formdata,
                dataType: "json",
                contentType: false,
                cache: false,
                processData: false,
                success: function (response) {
                    console.log(response);
                    $("#table-22").DataTable().ajax.reload(null, false);
                    $(".loader").hide();
                    $("#addcat").modal("hide");
                    $("#addForm")[0].reset();

                    if (response.status == false) {
                        iziToast.error({
                            title: app.Error,
                            message: response.message,
                            position: "topRight",
                        });
                    }
                },
                error: function (err) {
                    console.log(err);
                },
            });
        } else {
            iziToast.error({
                title: app.Error,
                message: app.tester,
                position: "topRight",
            });
        }
    });


    $("#edit_cat").on('submit',function(event) {
        event.preventDefault();
        $('.loader').show();
        if (user_type == "1") {
            var formdata = new FormData($("#edit_cat")[0]);
            $.ajax({
                url: `${domainUrl}updateDiamondPack`,
                type: 'POST',
                data: formdata,
                dataType: "json",
                contentType: false,
                cache: false,
                processData: false,
                success: function(response) {
                console.log(response);
                $('#table-22').DataTable().ajax.reload(null, false);
                 $('#edit_cat')[0].reset();
                $('.loader').hide();
                $('#edit_cat_modal').modal('hide');

                },
                error: function(err) {
                    console.log(err);

                }

            });

        } else {
            iziToast.error({
                title: app.Error,
                message: app.tester,
                position: 'topRight'
            });
        }
    });

    $("#table-22").on("click",".delete-cat",function(event) {

        event.preventDefault();
        swal({
                title: `${app.sure}`,
                icon: "warning",
                buttons: true,
                dangerMode: true,
            })
            .then((willDelete) => {
                if (willDelete) {
                    swal("Item Delete Successfully", {
                        icon: "success",
                    });

                    if (user_type == "1") {
                        var element = $(this).parent();

                        var cat_id = $(this).attr("rel");
                        var delete_cat_url = `${domainUrl}deleteDiamondPack`+"/"+cat_id;

                        $.getJSON(delete_cat_url).done(function(data) {
                            console.log(data);
                            $('#table-22').DataTable().ajax.reload(null, false);
                        });
                    } else {
                        iziToast.error({
                            title: app.Error,
                            message: app.tester,
                            position: 'topRight'
                        });
                    }

                }
            });


    });

    $("#table-22").on("click",".edit_cats",function(event) {
        $('#lang').val("");
        event.preventDefault();
        $('#edit_cat')[0].reset();
        var  id = $(this).attr('rel');
        $('#editId').val($(this).attr('rel'));
        var url =  `${domainUrl}getDiamondPackById`+"/"+id;
        $.getJSON(url).done(function(data) {
            $('#edit_plan_type').val(data.type);
            $('#edit_name').val(data.name);
            $('#edit_description').val(data.description);
            $('#edit_price').val(data.price);
            $('#edit_limit').val(data.limited);
            $('#edit_duration').val(data.duration);
            $('#edit_features').val(data.metadata);
            $('#edit_free_boost').val(data.free_boost);
            $('#edit_boost_duration').val(data.boost_duration);
            $('#edit_superlike_duration').val(data.superlike_duration);
            $('#edit_free_superlike').val(data.free_superlike);
            $('#edit_plan_type').trigger('change');
            $('#edit_cat_modal').modal('show');
        });
        
    });
    $(document).on('click','.plan_lang',function(){
        id=$(this).parent().prev('.plan_id').attr('id');
        lang=$(this).attr('id');
        $.ajax({
         url: `${domainUrl}getDiamondPackById`+"/"+id,
         type: "GET",
         beforeSend: function(xhr){xhr.setRequestHeader('lang',lang);},
         success: function(result) {
            data=JSON.parse(result);
            $('#lang_edit_name').val(data.name);
            $('#lang_edit_description').val(data.description);
            if(data.type=='boosts' || data.type=='super_likes'){
                $('.lang_edit_features').hide();
            }else{
                $('#lang_edit_features').val(data.metadata); 
                $('.lang_edit_features').show();
            }
            $('#lang_editid').val(data.id);
            $('#lang').val(lang);
            $('#lang_edit_cat_modal').modal('show');
         }
      });
    });
     $("#lang_edit_cat").on('submit',function(event) {
        event.preventDefault();
        $('.loader').show();
        if (user_type == "1") {
            var formdata = new FormData($("#lang_edit_cat")[0]);
            $.ajax({
                url: `${domainUrl}updateDiamondPack`,
                type: 'POST',
                data: formdata,
                dataType: "json",
                contentType: false,
                cache: false,
                processData: false,
                success: function(response) {
                        $('#lang_edit_cat')[0].reset();
                        $('.loader').hide();
                        $('#lang_edit_cat_modal').modal('hide');

                },
                error: function(err) {
                    console.log(err);

                }
            });

        } else {
            iziToast.error({
                title: app.Error,
                message: app.tester,
                position: 'topRight'
            });
        }
    });
});
