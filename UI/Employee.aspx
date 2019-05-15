<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="UI.Employee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <title>Employee</title>


    <!--  CSS -->
    <link rel="stylesheet" type="text/css" runat="server" href="~/Content/bootstrap.css" />



</head>
<body>

    <form id="form1" runat="server" method="post" accept-charset="utf-8">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server" LoadScriptsBeforeUI="False">
            <Scripts>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js"></asp:ScriptReference>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js"></asp:ScriptReference>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js"></asp:ScriptReference>

            </Scripts>
        </telerik:RadScriptManager>
        <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server">
            <div class="container">

                <div class="row">
                    <div class="col-sm-12 ">
                        <h3>Employee</h3>

                    </div>

                </div>
                <div class="form-group row">
                    <label class="col-sm-3 col-form-label" for="txt_lastName">Last Name:</label>
                    <div class="col-sm-9">
                        <telerik:RadTextBox ID="txt_lastName" runat="server">
                        </telerik:RadTextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="(*)" ControlToValidate="txt_lastName" CssClass="alert-danger"></asp:RequiredFieldValidator>
                    </div>

                </div>
                <div class="form-group row">
                    <label class="col-sm-3 col-form-label" for="txt_firstName">First Name:</label>
                    <div class="col-sm-9">

                        <telerik:RadTextBox ID="txt_firstName" runat="server">
                        </telerik:RadTextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="(*)" ControlToValidate="txt_firstName" CssClass="alert-danger"></asp:RequiredFieldValidator>
                    </div>

                </div>
                <div class="form-group row">
                    <label class="col-sm-3 col-form-label" for="mtxt_phone">Phone:</label>
                    <div class="col-sm-9">
                        <telerik:RadMaskedTextBox ID="mtxt_phone" runat="server" Mask="(###) ###-####"></telerik:RadMaskedTextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="(*)" ControlToValidate="mtxt_phone" CssClass="alert-danger"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="mtxt_phone" ErrorMessage="Check phone format" CssClass="alert-danger" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>

                </div>
                <div class="form-group row">
                    <label class="col-sm-3 col-form-label" for="txt_zip">Zip:</label>
                    <div class="col-sm-9">
                        <telerik:RadTextBox ID="txt_zip" runat="server">
                        </telerik:RadTextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="(*)" ControlToValidate="txt_zip" CssClass="alert-danger"></asp:RequiredFieldValidator>

                    </div>

                </div>
                <div class="form-group row">
                    <label class="col-sm-3 col-form-label" for="dp_HiredDate">Hired Date:</label>
                    <div class="col-sm-9">
                        <telerik:RadDatePicker ID="dp_HiredDate" runat="server" Culture="es-ES" MaxDate="2019-12-31">
                            <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True" Culture="es-ES" FastNavigationNextText="&amp;lt;&amp;lt;"></Calendar>

                            <DateInput DisplayDateFormat="MM/dd/yyyy" DateFormat="MM/dd/yyyy" LabelWidth="40%">
                                <EmptyMessageStyle Resize="None"></EmptyMessageStyle>

                                <ReadOnlyStyle Resize="None"></ReadOnlyStyle>

                                <FocusedStyle Resize="None"></FocusedStyle>

                                <DisabledStyle Resize="None"></DisabledStyle>

                                <InvalidStyle Resize="None"></InvalidStyle>

                                <HoveredStyle Resize="None"></HoveredStyle>

                                <EnabledStyle Resize="None"></EnabledStyle>
                            </DateInput>

                            <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                        </telerik:RadDatePicker>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="(*)" ControlToValidate="dp_HiredDate" CssClass="alert-danger"></asp:RequiredFieldValidator>
                    </div>

                </div>
                <div class="row">
                    <div class="col-12 text-center">
                        <telerik:RadButton ID="btn_Save" runat="server" Text="Save" OnClick="btn_Save_Click"></telerik:RadButton>
                        <telerik:RadButton ID="btn_Cancel" runat="server" Text="Cancel" OnClick="btn_Cancel_Click" CausesValidation="false" ></telerik:RadButton>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-12">

                        <telerik:RadGrid ID="grd_employee" runat="server" AutoGenerateColumns="False" CellSpacing="-1" Culture="es-ES" GridLines="Both" OnNeedDataSource="grd_employee_NeedDataSource" OnDeleteCommand="grd_employee_DeleteCommand" OnSelectedIndexChanged="grd_employee_SelectedIndexChanged" AllowFilteringByColumn="True">
                            <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                            <MasterTableView DataKeyNames="EmployeeID">
                                <Columns>
                                    <telerik:GridButtonColumn CommandName="Select" FilterControlAltText="Filter column column" Text="Select" UniqueName="column">
                                    </telerik:GridButtonColumn>
                                    <telerik:GridBoundColumn DataField="EmployeeLastName" FilterControlAltText="Filter lastName column" HeaderText="Last Name" UniqueName="lastName" CurrentFilterFunction="Contains" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="EmployeeFirstName " FilterControlAltText="Filter firstName column" HeaderText="First Name" UniqueName="firstName" AllowFiltering="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridTemplateColumn CurrentFilterFunction="Contains" DataField="EmployeePhone" FilterControlAltText="Filter phone column" HeaderText="Phone" UniqueName="phone" AutoPostBackOnFilter="True" ShowFilterIcon="False">
                                        <EditItemTemplate>
                                            <telerik:RadMaskedTextBox ID="EmployeePhoneRadMaskedTextBox" runat="server" Mask="(###) ###-####" Text='<%# Bind("EmployeePhone") %>'>
                                            </telerik:RadMaskedTextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="EmployeePhoneLabel" runat="server" Text='<%# FormatPhoneNumber(Eval("EmployeePhone").ToString()) %>'></asp:Label>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="EmployeeZip" FilterControlAltText="Filter zip column" HeaderText="Zip" UniqueName="zip" AllowFiltering="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridDateTimeColumn DataField="HireDate" DataFormatString="{0:MM/dd/yyyy}" FilterControlAltText="Filter hiredDate column" UniqueName="hiredDate" HeaderText="Hired Date" AllowFiltering="False">
                                    </telerik:GridDateTimeColumn>
                                    <telerik:GridButtonColumn CommandName="Delete" FilterControlAltText="Filter column1 column" Text="Delete" UniqueName="column1" ConfirmText="Do you want to erase the employee?">
                                    </telerik:GridButtonColumn>

                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>

                    </div>
                </div>
            </div>
            <telerik:RadNotification ID="notification" runat="server" Animation="Slide" Position="TopRight" EnableRoundedCorners="true" EnableShadow="true" AutoCloseDelay="3000" KeepOnMouseOver="false" Pinned="true" ShowCloseButton="true" Skin="Outlook"></telerik:RadNotification>

        </telerik:RadAjaxPanel>

    </form>
</body>
</html>
