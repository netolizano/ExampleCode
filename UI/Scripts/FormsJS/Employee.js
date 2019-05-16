$(document).ready(function () {

    $.validate({
        form: '#form1',
        rules: {
            cmb_Option: "required",
            txt_Option: "required"
        }

    });

    // On button click
    $("#btn_Search").click(function (e) {
        //prevent postback
        e.preventDefault();
        var type = $("#cmb_Option").val();
        var value = $("#txt_Option").val();

        //URL the search on the WebAPI method
        var urlApi = "api/Employee/searchEmployee?";
        if (value) {
            $.ajax({
                type: "GET",
                url: urlApi.concat("type=", type, "&value=", value),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $.each(data, function (key, value) {
                        var jsonData = JSON.stringify(value);
                        var objData = $.parseJSON(jsonData);
                        var id = objData.EmployeeID;
                        var fname = objData.EmployeeFirstName;
                        var lname = objData.EmployeeLastName;
                        var phone = objData.EmployeePhone;
                        var zip = objData.EmployeeZip;
                        var hiredDate = objData.HireDate;
                        $('<tr><td>' + id + '</td><td>' + fname + '</td><td>' + lname + '</td><td>' + phone + '</td><td>' + zip + '</td><td>' + hiredDate + '</td></tr>').appendTo('#tb_Employee');
                    });
                },
                error: function (errormsg) {
                    alert(errormsg.responseText);
                }
            });
        }



    });

});