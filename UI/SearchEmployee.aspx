<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SearchEmployee.aspx.cs" Inherits="UI.SearchEmployee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!--  CSS -->
    <link rel="stylesheet" type="text/css" runat="server" href="~/Content/bootstrap.css" />
    <link href="Content/bootstrapValidator.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="container">
            <div class="row">
                <div class="col-sm-12 ">
                    <h3>
                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>
                        Search Employee</h3>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-3 col-form-label" for="cmb_Option">Select the option to search:</label>
                <div class="col-sm-9">
                    <select id="cmb_Option" name="cmb_Option" data-validation="required" data-validation-error-msg="This field is required">
                        <option selected="selected" value="1">Last Name</option>
                        <option value="2">Phone</option>
                    </select>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-3 col-form-label" for="txt_Option">Data to search</label>
                <div class="col-sm-9">
                    <input id="txt_Option" name="txt_Option" type="text" data-validation="required" data-validation-error-msg="This field is required" />
                </div>
            </div>
            <div class="row">
                <div class="col-12 text-center">
                    <input type="button" id="btn_Search" class="btn btn-default" value="Search" />
                </div>
            </div>

            <div class="row">
                <div class="col-12 text-center">
                    <table border='1' id="tb_Employee">
                        <!-- Make a Header Row -->
                        <tr>
                            <td><b>EmployeeID</b></td>
                            <td><b>FirstName</b></td>
                            <td><b>LastName</b></td>
                            <td><b>Phone</b></td>
                            <td><b>Zip</b></td>
                            <td><b>Hired Date</b></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <script src="Scripts/jquery-3.3.1.min.js"></script>
        <script src="Scripts/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/jquery.form-validator.min.js"></script>
        <script src="Scripts/FormsJS/employee.js"></script>
</asp:Content>
