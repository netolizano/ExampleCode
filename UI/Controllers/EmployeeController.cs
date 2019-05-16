using BusinessLayer;
using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace UI.Controllers
{
    public class EmployeeController : ApiController
    {
       

        [ActionName("searchEmployee")]
        [HttpGet]
        public HttpResponseMessage Get(int type, string value )
        {
            EmployeeBL bl = new EmployeeBL();
            List<EmployeeET> employees = new List<EmployeeET>();
            if (type==1)
            {
                //search by lastName
                employees= bl.GetByLastName(value);
            }
            else
            {
                //Search employee by phone
               
                EmployeeET item = bl.GetByPhone(value);
                if (item != null)
                {
                    employees.Add(item);
                }
               
            }
            return Request.CreateResponse(HttpStatusCode.OK, employees);
        }

       
    }
}