$(document).ready(function () {
    $(".sideBarli").removeClass("activeLi");
    $(".optionSideA").addClass("activeLi");
    $(".optionaddModalbtn").on("click", function (event) {
        event.preventDefault();
        $("#addForm")[0].reset();
        $("#defaultimg").attr("src", `${domainUrl}asset/image/default.png`);
    });

    $("#optionTable").dataTable({
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
            url: `${domainUrl}fetchAlloptions?per_q_id=`+$('.per_q_id').val(),
            data: function (data) {},
        },
    });

    $("#optionTable").on("click", ".edit_cats", function (event) {
        $("#edit_cat")[0].reset();
        $("#editcat_title").val($(this).data("id"));
        $("#editcatid").val($(this).attr("id"));
        $("#edit_cat_modal").modal("show");
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
            console.log(imageInput[0].files[0]);
        }
    });

    $("#edit_cat").on("submit", function (event) {
        event.preventDefault();
        $(".loader").show();

        if (user_type == "1") {
            var formdata = new FormData($("#edit_cat")[0]);
            console.log(formdata);

            $.ajax({
                url: `${domainUrl}updateoptions`,
                type: "POST",
                data: formdata,
                dataType: "json",
                contentType: false,
                cache: false,
                processData: false,
                success: function (response) {
                    console.log(response);

                    if (response.status == true) {
                        $("#optionTable")
                            .DataTable()
                            .ajax.reload(null, false);
                        $("#edit_cat")[0].reset();
                        $(".loader").hide();
                        $("#edit_cat_modal").modal("hide");
                    }
                },
                error: function (err) {
                    $(".loader").hide();

                    console.log(JSON.stringify(err));
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
                url: `${domainUrl}addoptions`,
                type: "POST",
                data: formdata,
                dataType: "json",
                contentType: false,
                cache: false,
                processData: false,
                success: function (response) {

                    if (response.status == true) {
                        $("#optionTable")
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

                    console.log(JSON.stringify(err));
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

    $("#optionTable").on("click", ".delete-cat", function (event) {
        event.preventDefault();

        swal({
            title: `${app.sure}`,
            icon: "warning",
            buttons: true,
            dangerMode: true,
        }).then((willDelete) => {
            if (willDelete) {
                swal(`${app.Youroptionhasbeendeleted}`, {
                    icon: "success",
                });

                if (user_type == "1") {
                    var element = $(this).parent();

                    var cat_id = $(this).attr("rel");
                    var delete_cat_url =
                        `${domainUrl}deleteoptions` + "/" + cat_id;

                    $.getJSON(delete_cat_url)
                        .done(function (data) {})
                        .catch(function (data) {
                            console.log(data);
                        });
                    $("#optionTable").DataTable().ajax.reload(null, false);
                } else {
                    iziToast.error({
                        title: `${app.Error}!`,
                        message: `${app.tester}`,
                        position: "topRight",
                    });
                }
            } else {
                swal(`${app.optionafe}`);
            }
        });
    });
    $(document).on('click','.edit_cats',function(){
         $('#lang').val("");
    });
    $(document).on('click','.option_lang',function(){
        id=$(this).parent().prev('.option_id').attr('id');
        lang=$(this).attr('id');
        $.ajax({
         url: `${domainUrl}getoptions`,
         data: { id: id },
         type: "GET",
         beforeSend: function(xhr){xhr.setRequestHeader('lang',lang);},
         success: function(result) {
            result=JSON.parse(result);
            if(result.status){
                $('#edit_cat_modal').modal('show');
                $('#editcatid').val(id);
                $('#lang').val(lang);
                $('#editcat_title').val(result.data.name);
            }
         }
      });
    });
});