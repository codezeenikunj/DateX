$(document).ready(function () {
    var productimages = [];
    $.get(`${domainUrl}data/country_code.json`,function(result){
            $.each(result,function(i,v){
               $('#country_code').append($("<option></option>")
                    .attr("value",'+'+v.code)
                    .text('+'+v.code+'('+v.country+')')); 
            })
    })
    $('#country_code')
    $(document).on("change", "#productimages", function () {
        var imgElement = "";
        var input = $("#productimages")[0];
        var placeToInsertImagePreview = $("#photo_gallery2");

        for (let x = 0; x < $("#productimages")[0].files.length; x++) {
            productimages.push($("#productimages")[0].files[x]);
        }

        var allowedExtensions = /(\.jpg|\.jpeg|\.png|\.jfif|\.webp)$/i;

        console.log(productimages);

        for (let i = 0; i < $("#productimages")[0].files.length; i++) {
            console.log($("#productimages")[0].files[i]);

            if (!allowedExtensions.exec(input.value)) {
                iziToast.error({
                    title: `${app.Error}!`,
                    message: `${app.imageFileExtensions}`,
                    position: "topRight",
                });
                input.value = "";
                return false;
            } else {
                var reader = new FileReader();
                reader.onload = function (event) {
                    $(placeToInsertImagePreview).append(`
                    <div class="borderwrap2 " data-href="">
                        <div class="filenameupload2">
                        <img class="rounded " src="${event.target.result}"
                                width="130" height="130">
                            <div data-pos="${input.files[i].name}" data-imgid="" class="middle"><i
                                    class="material-icons remove_img2">cancel</i>
                            </div>
                        </div>
                    </div>
                    `);
                };

                reader.readAsDataURL(input.files[i]);
            }
        }
    });

    $(document).on("click", ".remove_img2", function () {
        var pos = $(this).parent().attr("data-pos");
        $(this).closest("div").parent().parent().remove();
        var fileArr = Array.from(productimages);

        var i = 0;

        console.log(productimages);
        console.log(fileArr);

        for (let x = 0; x < productimages.length; x++) {
            console.log(pos);
            if (pos == productimages[x].name) {
                fileArr.splice(x, 1);
            }
        }

        productimages = fileArr;

        console.log(productimages);
        console.log(productimages.length);
    });

    $("#addForm").on("submit", function (event) {
        event.preventDefault();
        $(".loader").show();

        if (productimages.length == 0) {
            $(".loader").hide();
            iziToast.error({
                title: "Error",
                message: "Minimum One Image is required !",
                position: "topRight",
            });
        } else {
            var formdata = new FormData(this);

            for (let x = 0; x < productimages.length; x++) {
                formdata.append("image[" + x + "]", productimages[x]);
            }

            $.ajax({
                url: `${domainUrl}addFakeUserFromAdmin`,
                type: "POST",
                data: formdata,
                dataType: "json",
                contentType: false,
                cache: false,
                processData: false,
                success: function (response) {
                    console.log(response);

                    if (response.status) {
                        window.location.href = `${domainUrl}users`;
                        // location.reload();
                    } else {
                        $(".loader").hide();
                        iziToast.error({
                            title: `${app.Error}!`,
                            message: response.message,
                            position: "topRight",
                        });
                    }
                },
                error: (error) => {
                    console.log(JSON.stringify(error));
                },
            });
        }
    });
});
