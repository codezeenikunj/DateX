$(document).ready(function () {
    $(".sideBarli").removeClass("activeLi");
    $(".personal_questionSideA").addClass("activeLi");

    $(".personal_questionaddModalbtn").on("click", function (event) {
        event.preventDefault();
        $("#addForm")[0].reset();
        $("#defaultimg").attr("src", `${domainUrl}asset/image/default.png`);
    });

    $("#personal_questionTable").dataTable({
        processing: true,
        serverSide: true,
        serverMethod: "post",
        aaSorting: [[0, "desc"]],
        columnDefs: [
            {
                targets: [0, 1],
                orderable: false,
            },
        ],
        ajax: {
            url: `${domainUrl}fetchAllpersonal_question`,
            data: function (data) {},
        },
    });

    $("#personal_questionTable").on("click", ".edit_cats", function (event) {
        $('.editperq_image').show();
        $('#lang').val("");
        $("#edit_cat")[0].reset();
        id=$(this).attr('id');
        $.ajax({
         url: `${domainUrl}getpersonal_question`,
         data: { id: id },
         type: "GET",
         success: function(result) {
            result=JSON.parse(result);
            $('.editperq_image').show();
            $('.editperq_type').show();
            $('#editcatid').val(result.data.id);
            $('#editperq_title').val(result.data.title);
            $('#editperq_question').val(result.data.question);
            $('#editperq_type').val(result.data.type);
            $('#edit_perq_modal').modal('show');
         }
        });
        
    });
    $(document).on('click','.personal_question_lang',function(){
        $("#edit_cat")[0].reset();
        id=$(this).parent().prev('.personal_question_id').attr('id');
        lang=$(this).attr('id');
        $.ajax({
         url: `${domainUrl}getpersonal_question`,
         data: { id: id },
         type: "GET",
         beforeSend: function(xhr){xhr.setRequestHeader('lang',lang);},
         success: function(result) {
            result=JSON.parse(result);
            if(result.status){
                $('.editperq_image').hide();
                $('.editperq_type').hide();
                $('#editcatid').val(id);
                $('#lang').val(lang);
                $('#editperq_title').val(result.data.title);
                $('#editperq_question').val(result.data.question);
                $('#edit_perq_modal').modal('show');
            }
         }
      });
    });
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $("#defaultimg").attr("src", e.target.result);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }

    $("#file").on("change", function () {
        readURL(this);
    });

    var imageInput = $("#editcat_image");
    imageInput.on("change", function () {
        if (imageInput[0].files && imageInput[0].files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $("#editshow_img")
                    .attr("src", e.target.result)
                    .width(150)
                    .height(150);
            };
            reader.readAsDataURL(imageInput[0].files[0]);
        }
    });

    $("#edit_cat").on("submit", function (event) {
        event.preventDefault();
        $(".loader").show();

        if (user_type == "1") {
            var formdata = new FormData($("#edit_cat")[0]);
           

            $.ajax({
                url: `${domainUrl}updatepersonal_question`,
                type: "POST",
                data: formdata,
                dataType: "json",
                contentType: false,
                cache: false,
                processData: false,
                success: function (response) {
                   

                    if (response.status == true) {
                        $("#personal_questionTable")
                            .DataTable()
                            .ajax.reload(null, false);
                        $("#edit_cat")[0].reset();
                        $(".loader").hide();
                        $('#edit_perq_modal').modal('hide');
                    }
                },
                error: function (err) {
                    $(".loader").hide();

                   
                },
            });
        } else {
            $(".loader").hide();
            iziToast.error({
                title: `${app.Error}!`,
                message: `${app.tester}`,
                position: "topRight",
            });
        }
    });

    $("#addForm").on("submit", function (event) {
        event.preventDefault();
        $(".loader").show();

        if (user_type == "1") {
            var formdata = new FormData($("#addForm")[0]);
           

            $.ajax({
                url: `${domainUrl}addpersonal_question`,
                type: "POST",
                data: formdata,
                dataType: "json",
                contentType: false,
                cache: false,
                processData: false,
                success: function (response) {
                  

                    if (response.status == true) {
                        $("#personal_questionTable")
                            .DataTable()
                            .ajax.reload(null, false);
                        $(".loader").hide();
                        $("#addcat").modal("hide");
                        $("#addForm")[0].reset();
                    } else {
                        $(".loader").hide();
                    }
                },
                error: function (err) {
                    $(".loader").hide();

                    
                },
            });
        } else {
            $(".loader").hide();
            iziToast.error({
                title: `${app.Error}!`,
                message: `${app.tester}`,
                position: "topRight",
            });
        }
    });

    $("#personal_questionTable").on("click", ".delete-cat", function (event) {
        event.preventDefault();

        swal({
            title: `${app.sure}`,
            icon: "warning",
            buttons: true,
            dangerMode: true,
        }).then((willDelete) => {
            if (willDelete) {
                swal(`${app.Yourpersonal_questionhasbeendeleted}`, {
                    icon: "success",
                });

                if (user_type == "1") {
                    var element = $(this).parent();

                    var cat_id = $(this).attr("rel");
                    var delete_cat_url =
                        `${domainUrl}deletepersonal_question` + "/" + cat_id;

                    $.getJSON(delete_cat_url)
                        .done(function (data) {})
                        .catch(function (data) {
                            
                        });
                    $("#personal_questionTable").DataTable().ajax.reload(null, false);
                } else {
                    iziToast.error({
                        title: `${app.Error}!`,
                        message: `${app.tester}`,
                        position: "topRight",
                    });
                }
            } else {
                swal(`${app.personal_questionafe}`);
            }
        });
    });
});
