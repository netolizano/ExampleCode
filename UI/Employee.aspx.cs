using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLayer;
using Entities;
using Telerik.Web.UI;

namespace UI
{
    public partial class Employee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btn_Save_Click(object sender, EventArgs e)
        {
            EmployeeBL ebl = new EmployeeBL();
            EmployeeET employee = getFormData();
            if (this.grd_employee.SelectedItems.Count == 0)
            {
                //insert operation
                if (ebl.Insert(employee))
                {
                    //refresh grid
                    grd_employee.Rebind();
                    showMessage("Employee inserted", "Success", "ok", "ok", "alert alert-success");
                    clearForm();
                }
                else
                {
                    //show errors
                    showMessage("There is an error", "Error", "delete", "delete", "alert alert-danger");
                }
            }
            else
            {
                //getID from grid
                employee.EmployeeID = Convert.ToInt32(this.grd_employee.MasterTableView.DataKeyValues[this.grd_employee.SelectedItems[0].ItemIndex]["EmployeeID"]);
                //update operation
                if (ebl.Update(employee))
                {
                    //refresh grid
                    grd_employee.Rebind();
                    showMessage("Employee updated", "Success", "ok", "ok", "alert alert-success");
                    clearForm();
                }
                else
                {
                    //show errors
                    showMessage("There is an error", "Error", "delete", "delete", "alert alert-danger");
                }

            }
        }

        private void showMessage(string message, string title, string titleIcon, string contentIcon, string cssClass)
        {
            //show notification messages
            notification.Text = message;
            notification.Title = title;
            notification.TitleIcon = titleIcon;
            notification.ContentIcon = contentIcon;
            notification.CssClass = cssClass;
            notification.Show();
        }

        protected void grd_employee_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            //when data is needed on the grid, this method will get all the data
            EmployeeBL ebl = new EmployeeBL();
            this.grd_employee.DataSource = ebl.GetAll();
        }

        protected void grd_employee_SelectedIndexChanged(object sender, EventArgs e)
        {
            //select event
            GridDataItem item = grd_employee.SelectedItems[0] as GridDataItem;
            if (item != null)
            {
                //get data from grid
                txt_firstName.Text = item["firstName"].Text;
                txt_lastName.Text = item["lastName"].Text;
                txt_zip.Text = item["zip"].Text;
                mtxt_phone.Text = (item.FindControl("EmployeePhoneLabel") as Label).Text;
                dp_HiredDate.SelectedDate = Convert.ToDateTime(item["hiredDate"].Text);
            }
        }

        protected void grd_employee_DeleteCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            //delete event
            GridDataItem item = (GridDataItem)e.Item;
            //get selected EmployeeID from grid
            int employeeID = Convert.ToInt32(item.GetDataKeyValue("EmployeeID").ToString());
            EmployeeBL ebl = new EmployeeBL();
            if (ebl.Delete(employeeID))
            {
                showMessage("Employee deleted", "Success", "ok", "ok", "alert alert-success");
            }
        }

        private EmployeeET getFormData()
        {
            //get data from the form 
            EmployeeET employee = new EmployeeET();
            employee.EmployeeFirstName = txt_firstName.Text;
            employee.EmployeeLastName = txt_lastName.Text;
            employee.EmployeePhone = mtxt_phone.Text;
            employee.EmployeeZip = txt_zip.Text;
            employee.HireDate = Convert.ToDateTime(dp_HiredDate.SelectedDate);

            return employee;
        }

        private void clearForm()
        {
            //clean fields 
            txt_firstName.Text = "";
            txt_lastName.Text = "";
            mtxt_phone.Text = "";
            txt_zip.Text = "";
            dp_HiredDate.Clear();
            this.grd_employee.MasterTableView.ClearSelectedItems();
        }

        public string FormatPhoneNumber(string phoneStr)
        {
            StringBuilder builder = new StringBuilder();
            builder.Append("(");
            builder.Append(phoneStr.Substring(0, 3));
            builder.Append(") ");
            builder.Append(phoneStr.Substring(3, 3));
            builder.Append("-");
            builder.Append(phoneStr.Substring(6, 4));
            return builder.ToString();
        }

    }
}