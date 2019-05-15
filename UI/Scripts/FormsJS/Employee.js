$(document).ready(function () {
    /***
     * Form validation
     * 
     * ***/
    $("#form1").bootstrapValidator({
        feedbackIcons: false,
        excluded: "disabled",
        fields: {
            txtLastName: {
                message: "invalid data",
                validators: {
                    notEmpty: {
                        message: " Last Name is Required"
                    }
                }
            },
            txtFirstName: {
                message: "Invalid data",
                validators: {
                    notEmpty: {
                        message: "First Name is Required"
                    }
                }
            },
            txtZip: {
                message: "Invalid data",
                validators: {
                    notEmpty: {
                        message: "Zip is Required"
                    }
                }
            },
            dp$HiredDate$dateInput: {
                message: "Invalid data",
                validators: {
                    notEmpty: {
                        message: "Hired date is Required"
                    }
                }
            }
        }

    }).on("success.form.bv", function (e) {
        e.preventDefault();
        var $form = $(e.target);
        alert($("#txtLastName").val());
    
    });
});